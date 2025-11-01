[![Open in Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open&color=blue&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTE3IDE2VjdsLTYgNU0yIDlWOGwxLTFoMWw0IDMgOC04aDFsNCAyIDEgMXYxNGwtMSAxLTQgMmgtMWwtOC04LTQgM0gzbC0xLTF2LTFsMy0zIi8+PC9zdmc+)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/ThinkVelta/velta-forge-backend)
[![Open in GitHub Codespaces](https://img.shields.io/static/v1?label=GitHub%20Codespaces&message=Open&color=blue&logo=github)](https://github.com/codespaces/new/ThinkVelta/velta-forge-backend)
[![Copier](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-black.json)](https://github.com/copier-org/copier)

# 🔥 Velta Forge (Backend)

Velta Forge (Backend) is Velta's official Copier template for bootstrapping modern Python backend services that follow the Velta Way of Work. It bundles Dev Container-ready tooling, sensible defaults for FastAPI-powered APIs, and automation that keeps new projects consistent with our operational standards.

> **When should I use this?**
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

## 📦 What's included

| Area | Details |
| --- | --- |
| Project scaffolding | `copier.yml` prompts for FastAPI API, project metadata, and documentation links.
| Source layout | `src/` package with `main.py` entrypoint and optional `api/` module, plus `tests/` for pytest suites.
| Tooling | `pyproject.toml` with FastAPI (optional), uv, Poe, pytest, Ruff, coverage, Commitizen, and pre-commit hooks.
| Dev environment | `.devcontainer/`, Dockerfile, docker-compose services, and VS Code recommendations.
| CI/CD | `.github/workflows/` for PR checks, testing, and optional deploy/publish jobs; `dependabot.yml` for automated upgrades.
| Docs & metadata | Template `README.md`, `CHANGELOG.md`, `LICENSE`, and Linear/Codex-friendly defaults.

## 🚀 Create a new backend service

1. **Install prerequisites**
   - [Docker Desktop](https://www.docker.com/get-started) or a compatible container runtime.
   - [VS Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers), Cursor, or Windsurf.
   - [`uv`](https://docs.astral.sh/uv/getting-started/installation/) and [`copier`](https://github.com/copier-org/copier) (both bundled in the Dev Container).
2. **Generate a repository**
   ```sh
   uvx copier copy gh:ThinkVelta/velta-forge-backend path/to/new-service
   ```
   Answer the prompts to set project metadata, choose whether to include the FastAPI API skeleton, and link documentation URLs.
3. **Bootstrap the environment**
   ```sh
   cd path/to/new-service
   uv sync --all-extras
   pre-commit install --install-hooks
   ```
4. **Open in your preferred environment**
   - Click the "Open in Dev Containers" badge above, or run **Dev Containers: Reopen in Container** from VS Code.
   - Alternatively, start a GitHub Codespace with the badge above.

## 🧑‍💻 Developing inside the scaffold

Once inside the Dev Container (or a local uv environment), use the Poe tasks defined in `pyproject.toml`:

```sh
poe           # List available tasks
poe serve     # Run the FastAPI app (auto-reloads in dev mode)
poe lint      # Run Ruff + pre-commit checks over src/ and tests/
poe test      # Execute pytest with coverage and junit reports
```

Additional tips:
- Use `uv add <package>` (`--dev` for dev dependencies) to manage dependencies.
- Run `uv sync --upgrade` to update dependencies while respecting version pins.
- Run `cz bump` to version releases following Conventional Commits.

## 🗂 Repository structure

```
velta-forge-backend/
├── copier.yml                 # Template questions and defaults
├── template/                  # Project files rendered by Copier
│   ├── README.md.jinja        # Project README scaffold
│   ├── pyproject.toml.jinja   # Tooling & dependency configuration
│   ├── src/                   # Application package template
│   ├── tests/                 # pytest starter suite
│   └── .github/workflows/     # CI pipelines (PR, test, deploy/publish)
├── test.sh                    # Smoke test for the template
└── uv.lock                    # Dependency lock for template maintenance
```

## 🛠 Maintaining the template

- Run `./test.sh` to validate the template renders, installs, and passes lint/test checks inside a Dev Container.
- Update dependencies with `uv sync --upgrade` and re-lock before committing.
- Follow Conventional Commits (`docs`, `feat`, `fix`, etc.) when changing the template so release automation stays accurate.

## 🧭 Working the Velta Way

This template encodes Velta's engineering standards. When you create a project from it:

1. **Repository & branches**
   - Name repos using kebab-case (`client-project-backend`).
   - Work on `feature/<ISSUE-ID>-short-description` branches cut from `dev`.
   - Use `hotfix/<short-description>` only for production fixes against `main`.
2. **Commits & PRs**
   - Write Conventional Commits (`feat(auth): add refresh token rotation`).
   - Keep commits scoped and rebased on the latest `dev` before opening a PR.
   - Open PRs targeting `dev`, link the Linear issue, and follow the Summary/Context/Implementation/Testing/Notes template.
   - Merge with **Squash & Merge** after Codex + human approvals; Ruben promotes `dev` → `main`.
3. **Quality gates**
   - Run `poe lint` and `poe test` locally before pushing.
   - Ensure CI (lint, tests, Codex review, build) is green prior to merge.
   - Maintain ≥80% coverage for backend modules and document exported functions/classes.
4. **Security & secrets**
   - Never commit secrets; rely on `.env` files or managed secret stores (Supabase, AWS, Vercel).
   - Use GitHub roles appropriately and request Ruben's approval for security-sensitive changes.
5. **AI-first, human-owned**
   - Use AI tools to accelerate development, but review and understand every change.
   - Keep AGENTS.md up to date so future AI collaborators follow the right conventions.

## 🤝 Contributing to Velta Forge

We welcome improvements that make spinning up Velta backends faster or safer. Please:

1. Open an issue describing the change and how it aligns with the Way of Work.
2. Work on a feature branch from `dev`, keeping commits conventional.
3. Update documentation (README, AGENTS) whenever behavior changes.
4. Run `./test.sh` and ensure GitHub Actions succeed before requesting review.

---

Need help or spot something outdated? Drop a message in `#way-of-work` on Slack and propose an update.
