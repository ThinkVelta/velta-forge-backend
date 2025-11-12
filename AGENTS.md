# Velta Forge Backend — Agent Guide

Welcome! This repository hosts the Copier template that bootstraps Velta backend services. Follow these guidelines whenever you modify files in this repo.

## General expectations
- Keep the scaffold production-ready. When changing behavior or tooling, update both documentation (`README.md`, changelog) and the generated template assets under `template/`.
- Prefer small, conventional commits (e.g. `feat(api): ...`). Coordinate larger refactors by updating template tests/docs in the same change.
- When touching template sources in `template/`, make corresponding adjustments to their rendered counterparts inside documentation or examples if applicable.

## Coding & tooling
- Python code must pass Ruff and pytest. Run `./test.sh` for the full template validation (it renders an example project and runs lint/test inside it).
- Use `uv` for dependency changes; update `pyproject.toml` and `uv.lock` consistently.
- Template logic lives in Jinja (`*.jinja`) files. Keep whitespace control explicit, and document non-obvious template expressions with inline comments.

## Documentation & agent collaboration
- Mirror any process change in both this `AGENTS.md` and the template copy at `template/AGENTS.md.jinja` so newly scaffolded repos inherit the guidance.
- When adding new features, describe them in `CHANGELOG.md` and ensure the README highlights user-facing updates.
- Prefer declarative instructions over prose when teaching downstream agents (lists, tables, code blocks).

## Testing checklist before PRs
1. `./test.sh`
2. `poe lint`
3. `poe test`

If a command is intentionally skipped (e.g. environment limitations), explain why in the PR description.

Thanks for keeping the scaffold sharp for future teams and agents!
