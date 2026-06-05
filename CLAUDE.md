# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
make build          # swift build
make test           # swift test
make lint           # swiftlint lint --strict
make fetch-spec     # Download latest OpenAPI spec from S3
```

Run a single test: `swift test --filter RootlyTests.testName`

First build is slow (~4-5 min) because swift-openapi-generator generates types and client code from the 87K-line OpenAPI spec. Subsequent builds use incremental compilation (~15s).

## Architecture

This is a Swift SDK for the Rootly API, auto-generated from an OpenAPI 3.0.1 spec using Apple's [swift-openapi-generator](https://github.com/apple/swift-openapi-generator).

**Code generation happens at build time** via a Swift Package Manager build plugin. There is no committed generated code. The generator reads `Sources/Rootly/openapi.json` + `Sources/Rootly/openapi-generator-config.yaml` and produces `Types.swift` and `Client.swift` into `.build/`.

**Hand-written code is minimal** — only `Sources/Rootly/Rootly.swift`:
- `makeClient(token:serverURL:transport:)` — factory function returning the generated `Client` configured with bearer auth
- `BearerMiddleware` — internal `ClientMiddleware` that injects `Authorization: Bearer <token>` header on every request
- `defaultServerURL` — `https://api.rootly.com`

The Rootly API uses `application/vnd.api+json` (JSON:API) content type. The generator handles this natively because the subtype ends with `+json`.

## Updating the OpenAPI Spec

```bash
make fetch-spec
```

Downloads from `https://rootly-heroku.s3.amazonaws.com/swagger/v1/swagger.json`. The `rootly.com` URL is behind Cloudflare bot protection — always use the S3 URL.

## Release Process

Push a semver tag to trigger automated GitHub Release:

```bash
git tag -a "v1.0.0" -m "Release v1.0.0"
git push origin v1.0.0
```
