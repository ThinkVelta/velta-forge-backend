[![Open in Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open&color=blue&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTE3IDE2VjdsLTYgNU0yIDlWOGwxLTFoMWw0IDMgOC04aDFsNCAyIDEgMXYxNGwtMSAxLTQgMmgtMWwtOC04LTQgM0gzbC0xLTF2LTFsMy0zIi8+PC9zdmc+)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/ThinkVelta/velta-forge-backend)
[![Open in GitHub Codespaces](https://img.shields.io/static/v1?label=GitHub%20Codespaces&message=Open&color=blue&logo=github)](https://github.com/codespaces/new/ThinkVelta/velta-forge-backend)
[![Copier](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-black.json)](https://github.com/copier-org/copier)

# 🔥 Velta Forge (Backend)

Velta Forge (Backend) is Velta's official Copier template for bootstrapping modern Python backend services that follow the *Velta Way of Work*. It bundles Dev Container-ready tooling, sensible defaults for FastAPI-powered APIs, and automation that keeps new projects consistent with our operational standards.

> **When should I use this?**
>
> - When you spin up a new backend repo in the Velta organization.
> - When you need a reproducible FastAPI-ready scaffold with CI, testing, and linting already wired up.
> - When you want Codex and Linear-friendly conventions applied from day one.

## ✨ Highlights

- 🚀 **FastAPI-ready application skeleton** with optional REST API wiring, uvicorn/gunicorn serving, and Docker-based runtime.
- 🧱 **Dev Container and Codespaces support** for a uniform Linux development environment (Dockerfile, `docker-compose.yml`, and VS Code configuration).
- 🧰 **uv-first dependency and packaging workflow** with Poe the Poet tasks for serving, linting, and testing.
- ✅ **Quality gates baked in** through Ruff linting, pytest + coverage, Conventional Commits, and commit hooks.
- 🤖 **Automation** with GitHub Actions (PR checks, test matrix, optional deploy/publish) and Dependabot updates.
- 🔐 **Production-friendly defaults** including environment variable management, gunicorn configuration, and Docker images ready for container platforms.

## 🧑‍💻 Usage

In order to make use of this template, make sure you complete **all** of the following steps:

1. **Install prerequisites (one-time setup)**
   - [Docker Desktop](https://www.docker.com/get-started) or a compatible container runtime.
   - [VS Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers), or one of VSCode's forks like [Cursor](https://www.cursor.com/), or [Windsurf](https://windsurf.dev/).
   - [`uv`](https://docs.astral.sh/uv/getting-started/installation/) through `brew install uv` or [another installation method](https://docs.astral.sh/uv/getting-started/installation/).
2. **Generate a repository**

   ```sh
   uvx copier copy gh:ThinkVelta/velta-forge-backend path/to/new-service
   ```

3. **Prepare your GitHub repository**
   - Make sure to have a `main` branch and a `dev` branch (*both required* for the CI/CD workflows to work).
   - Set your `dev` branch as the default branch in your GitHub repository (`Settings` -> `General` -> `Default branch`), since new pull requests should be opened against the `dev` branch.
   - Set the `OPENAI_API_KEY` environment variable in your GitHub repository secrets (`Settings` -> `Secrets and variables` -> `Actions` -> `New repository secret`) to ensure the Codex AI agent can perform its job.

4. **Open in your preferred environment**
   - Open the repository in a devcontainer by running **Dev Containers: Reopen in Container** in your IDE of choice (VSCode, Cursor, or Windsurf).
   - Alternatively, start a GitHub Codespace with the badge above.

## 📦 What's included

| Area | Details |
| --- | --- |
| Project scaffolding | `copier.yml` prompts for FastAPI API, project metadata, and documentation links.
| Source layout | `src/` package with `main.py` entrypoint and optional `api/` module, plus `tests/` for pytest suites.
| Tooling | `pyproject.toml` with FastAPI (optional), uv, Poe, pytest, Ruff, coverage, Commitizen, and pre-commit hooks.
| Dev environment | `.devcontainer/`, Dockerfile, docker-compose services, and VS Code recommendations.
| CI/CD | `.github/workflows/` for PR checks, change summary, testing, and optional deploy/publish jobs; `dependabot.yml` for automated upgrades.
| Docs & metadata | Template `README.md`, `AGENTS.md`, `CHANGELOG.md`, and Linear/Codex-friendly defaults.

## 🧑‍💻 Developing inside the scaffold

Once inside the Dev Container (or a local uv environment), use the Poe tasks defined in `pyproject.toml`:

```sh
poe           # List available tasks
poe serve     # Run the FastAPI app (auto-reloads in dev mode)
poe lint      # Run Ruff + pre-commit checks over src/ and tests/
poe test      # Execute pytest with coverage and junit reports
```

Additional, these are the other most common commands you'll be using while developing:

- Use `uv add <package>` (`--dev` for dev dependencies) to manage dependencies.
- Run `uv sync --upgrade` to update dependencies while respecting version pins.
- Run `cz bump` to version releases following Conventional Commits.

## 🧭 Working the Velta Way

This template encodes Velta's engineering standards. Here are some tips and tricks to make the most out of it:

1. **Repository & branches**
   - Work on feature branches — linked to Linear issues — cut from `dev`.
   - Clearly refer to the Linear issue in the feature branch name (e.g. `feature/<ISSUE-ID>/short-description`) and link the PR to the issue in the description.
   - Use `hotfix/<short-description>` only for production fixes against `main` — though not preferred.

2. **Commits & PRs**
   - Write Conventional Commits (e.g. `feat(auth): add refresh token rotation`).
   - Keep commits scoped and rebased on the latest `dev` before opening a PR.
   - Merge feature branches into `dev` with **Squash & Merge** after Codex + human approvals.
   - Open PRs targeting `dev`, link the Linear issue, and follow the following template:

      ```markdown
      ### Summary
      Short description of what this PR implements or fixes.

      ### Context
      Link to the Linear issue and describe the reasoning or problem behind the change.

      ### Implementation details
      List main code changes, relevant files, or design choices.

      ### Testing (optional)
      Steps to reproduce, test, or validate the fix. Include local test commands if needed.

      ### Notes (optional)
      Trade-offs, limitations, or follow-ups.
      ```

   - Merge `dev` into `main` using Codex's change summary as a description guide.

3. **Quality gates**
   - Run `poe lint` and `poe test` locally before pushing to prevent unnecessary CI failures.
   - Ensure CI (lint, tests, Codex review) is green and addressed prior to merge.
   - Maintain ≥50% coverage for backend modules and document exported functions/classes.

4. **Security & secrets**
   - Never commit secrets; rely on `.env` files or managed secret stores (Supabase, AWS, Vercel).
   - Work with protected branches and protected files appropriately.

5. **AI-first, human-owned**
   - Initiate each new feature branches by feeding your problem (like a Linear Issue description) to Codex or another AI agent, and iterate from there manually.
   - Keep `AGENTS.md` up to date so future AI collaborators follow the right conventions.
   - Use AI tools to accelerate development, but review and understand every change.
   - Review the PR with Codex before merging. Give it time to finish, and interact with it in the PR comments if there's something you don't agree with. Note that Codex will only re-run on new commits, not on new comments.

## 🤝 Contributing to Velta Forge

We welcome improvements that make spinning up Velta backends faster or safer. Please:

1. Open an issue describing the change and how it aligns with the above's Way of Work.
2. Work on a decicated feature branch addressing the issue, keeping commits conventional.
3. Update documentation (README, AGENTS) whenever behavior changes.
4. Run `./test.sh` and ensure GitHub Actions succeed before requesting review.
5. Use `Squash & Merge` to merge your PRs after Codex + human approvals.
6. Bump the template version with `cz bump` and push the changes to the `main` branch.

Need help or spot something outdated? Tag me directly in your GitHub issue (`@RubenBroekx`).

## 💝 Credits

This template is inspired by [Superlinear's Substrate](https://github.com/superlinear-ai/substrate/) repository — a modern [Copier template](https://github.com/copier-org/copier) for scaffolding Python packages and apps.
