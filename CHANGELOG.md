# Changelog

## v1.0.0 (2025-11-12)

### Highlights
- Launched the Velta Forge Backend Copier template as the canonical starting point for new Velta services, bundling documentation and automation that reflect the Velta Way of Work.

### Added
- FastAPI-ready application skeleton with optional REST API module, `main.py` entrypoint, and pytest suite wiring to keep new services production-ready from day one.
- Dev Container, Docker Compose, and Dockerfile assets so teams can develop inside a consistent Linux environment locally or in GitHub Codespaces.
- uv-driven project configuration with Poe the Poet tasks for serving, linting, and testing, plus Ruff, pytest, coverage, and Commitizen integrations to enforce quality gates automatically.
- GitHub Actions workflows, Dependabot automation, and reusable test scripts (`test.sh`, `test-build.sh`) to validate rendered projects and keep dependencies healthy.
- Template-specific documentation (`README.md`, `AGENTS.md`, template changelog) that guides engineers and AI agents through the scaffold's conventions.

### Tooling & Maintenance
- Copier configuration (`copier.yml`) and template assets under `template/` mirroring the repository guidance, ensuring freshly generated projects inherit the same structure, docs, and guardrails.
