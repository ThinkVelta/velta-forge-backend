#!/bin/bash

set -e

# Set the parameters
PROJECT_NAME="My - 42nd - Project"
PYTHON_VERSION="3.12"
WITH_FASTAPI_API="true"

# Remove the project if it already exists
rm -rf my-project

# Scaffold a Python project
echo  -e "\nScaffolding project..."
uvx copier copy --vcs-ref=HEAD . my-project \
    --defaults \
    --data project_name="${PROJECT_NAME}" \
    --data project_description="A dummy Python project (with API: ${WITH_FASTAPI_API})." \
    --data project_url="https://github.com/user/repo" \
    --data author_name="John Smith" \
    --data author_email="john@example.com" \
    --data python_version="${PYTHON_VERSION}" \
    --data with_fastapi_api=${WITH_FASTAPI_API} \

echo  -e "\nInitializing Git..."
cd my-project
git init --initial-branch=main
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
