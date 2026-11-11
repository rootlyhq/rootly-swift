# Contributing

## Development

```bash
# Fetch latest OpenAPI spec
make fetch-spec

# Build
make build

# Run tests
make test

# Lint
make lint
```

## Pull Requests

1. Create a branch from `master`
2. Make focused changes (one feature/fix per PR)
3. Run `make build` and `make test`
4. Submit PR with a clear description

Use a [Conventional Commit](https://www.conventionalcommits.org/en/v1.0.0/)
title for each PR and its final squash commit:
`<type>(<optional scope>): <description>`. For example,
`feat(client): add support for incident search [PRF-1234]` or
`fix(auth): handle expired API tokens [PRF-1234]`.

Use `feat` for new features, `fix` for bug fixes, `docs` for documentation,
and `chore(deps)` for dependency updates. Mark breaking changes with `!`
before the colon, for example `feat!: remove a deprecated client method`.
Keep Linear issue IDs at the end of the title and link the issue in the
description. Release Please uses commit messages to generate release notes
and determine version bumps.

## Releases

Releases are automated via GitHub Actions. Push a semver tag to trigger:

```bash
git tag -a "v1.0.0" -m "Release v1.0.0"
git push origin v1.0.0
```
