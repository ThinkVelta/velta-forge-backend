#!/bin/bash

set -e

rm -rf my-project

with_fastapi_api=("false" "true")

for with_fastapi_api in "${with_fastapi_api[@]}"; do
    echo ""
    echo "-----------------------------------------------------------"
    echo "Testing Copier configuration with FastAPI API: ${with_fastapi_api} ..."
    echo "-----------------------------------------------------------"
    echo ""

    # Scaffold a Python project
    uvx copier copy --vcs-ref=HEAD . my-project \
        --defaults \
        --data project_name="My Project" \
        --data project_description="A dummy Python project (with API: ${with_fastapi_api})." \
        --data project_url="https://github.com/user/repo" \
        --data author_name="John Smith" \
        --data author_email="john@example.com" \
        --data python_version="3.12" \
        --data with_fastapi_api=${with_fastapi_api} \

    cd my-project
    git config --global init.defaultBranch main
    git init
    git checkout -b test
    git add .

    # Lint and test the project with a dev container
    devcontainer up --remove-existing-container --workspace-folder .
    devcontainer exec --workspace-folder . uv lock
    devcontainer exec --workspace-folder . poe lint
    devcontainer exec --workspace-folder . poe test

    # Build and test the app service
    docker compose build app
    docker compose up --force-recreate --detach app
    container_id=$(docker compose ps -q app)
    sleep 2

    # Verify API is accessible
    if [ "$with_fastapi_api" == "true" ]; then
        # Verify container is still running
        status=$(docker inspect --format='{{.State.Running}}' "$container_id")
        if [ "$status" != "true" ]; then
            docker compose logs app
            docker compose down
            exit 1
        fi

        # Check API is accessible
        if ! curl -f 'http://localhost:8000/hello_world' > /dev/null; then
            docker compose logs app
            docker compose down
            exit 1
        fi
    else
        # No API. Process may exit. --> Check container exit code instead (0 for graceful exit).
        exit_code=$(docker inspect --format='{{.State.ExitCode}}' "$container_id")
        if [ "$exit_code" != "0" ]; then
            docker compose logs app
            docker compose down
            exit 1
        fi
    fi

    cd -
    rm -rf my-project
done

echo ""
echo "-----------------------------------------------------------"
echo "All tests passed!"
echo "-----------------------------------------------------------"
echo ""
