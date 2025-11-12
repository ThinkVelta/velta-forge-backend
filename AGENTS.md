# Velta Forge Backend — Agent Guide

This repository hosts the Copier template that bootstraps Velta backend services. Follow these
guidelines whenever you modify files in this repo.

## General expectations

- Keep the scaffold production-ready. When changing behavior or tooling, update both documentation
  (`README.md`, `CHANGELOG.md`) and the generated template assets under `template/`.
- Prefer small, conventional commits (e.g. `feat(api): ...`). Coordinate larger refactors by
  updating template tests/docs in the same change.
- When touching template sources in `template/`, make corresponding adjustments to their rendered
  counterparts inside documentation or examples, if applicable.

## Coding & tooling

- Python code must pass Ruff and pytest. Run `./test.sh` for the full template validation (it
  renders an example project and runs lint/test inside it). If you want to build a single project
  without removing after completion, run `./test-build.sh`.
- Use `uv` for dependency changes; update `pyproject.toml` and `uv.lock` consistently.
- Template logic lives in Jinja (`*.jinja`) files. Keep whitespace control explicit, and document
  non-obvious template expressions with inline comments.

## Documentation & agent collaboration

- Mirror any process change in both this `AGENTS.md` and the template copy at
  `template/AGENTS.md.jinja` so newly scaffolded repos inherit the guidance.
- When adding new features, describe them in `CHANGELOG.md` and ensure the README highlights
  user-facing updates.
- Prefer declarative instructions over prose when teaching downstream agents (lists, tables, code
  blocks).
