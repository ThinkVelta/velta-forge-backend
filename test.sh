#!/bin/bash

set -e

rm -rf my-project

with_fastapi_api=("false" "true")

for with_fastapi_api in "${with_fastapi_api[@]}"; do
    echo  -e "\n-----------------------------------------------------------"
    echo  -e "Testing Copier configuration with FastAPI API: ${with_fastapi_api} ..."
    echo  -e "-----------------------------------------------------------\n"

    # Scaffold a Python project
    echo  -e "\nScaffolding project..."
    uvx copier copy --vcs-ref=HEAD . my-project \
        --defaults \
        --data project_name="My Project" \
        --data project_description="A dummy Python project (with API: ${with_fastapi_api})." \
        --data project_url="https://github.com/user/repo" \
        --data author_name="John Smith" \
        --data author_email="john@example.com" \
        --data python_version="3.12" \
        --data with_fastapi_api=${with_fastapi_api} \

    echo  -e "\nInitializing Git..."
    cd my-project
    git config --global init.defaultBranch main
    git init
    git checkout -b test
    git add .

    # Lint and test the project with a dev container
    echo  -e "\nStarting Dev Container..."
    devcontainer up --remove-existing-container --workspace-folder .
    echo  -e "\nLocking dependencies..."
    devcontainer exec --workspace-folder . uv lock
    echo  -e "\nLinting project..."
    devcontainer exec --workspace-folder . poe lint
    echo  -e "\nTesting project..."
    devcontainer exec --workspace-folder . poe test

    # Build and test the app service
    echo  -e "\nBuilding app service..."
    docker compose build app
    echo  -e "\nStarting app service..."
    docker compose up --force-recreate --detach app
    container_id=$(docker compose ps -q app)
    sleep 2

    # Verify API is accessible
    if [ "$with_fastapi_api" == "true" ]; then
        echo  -e "\nVerifying container is still running..."
        status=$(docker inspect --format='{{.State.Running}}' "$container_id")
        if [ "$status" != "true" ]; then
            docker compose logs app
            docker compose down
            exit 1
        fi

        echo  -e "\nChecking API is accessible..."
        if ! curl -f 'http://localhost:8000/health' > /dev/null; then
            docker compose logs app
            docker compose down
            exit 1
        fi
    else
        echo  -e "\nChecking if container ended gracefully..."
        exit_code=$(docker inspect --format='{{.State.ExitCode}}' "$container_id")
        if [ "$exit_code" != "0" ]; then
            docker compose logs app
            docker compose down
            exit 1
        fi
    fi

    echo  -e "\nRemoving project..."
    cd -
    rm -rf my-project
done

echo  -e "\n-----------------------------------------------------------"
echo  -e "All tests passed!"
echo  -e "-----------------------------------------------------------\n"
