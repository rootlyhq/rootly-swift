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

## Releases

Releases are automated via GitHub Actions. Push a semver tag to trigger:

```bash
git tag -a "v1.0.0" -m "Release v1.0.0"
git push origin v1.0.0
```
