# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- Initial Swift client generated from Rootly OpenAPI v1 spec using swift-openapi-generator
- `makeClient(token:serverURL:transport:)` factory function with bearer token authentication
- GitHub Actions CI (build, lint, test, release)
- Dependabot for Swift and GitHub Actions dependencies
- Alert configuration, private agent, problem, problem action item, status page team, and phone number verification endpoints
- Models for alert configuration, private agents, problems and action items, status page teams, acknowledgements, nullable severities, and overridden shifts

### Removed
- **BREAKING**: Alert re-trigger rule endpoints (`GET`/`POST /v1/alert_retrigger_rules` and `GET`/`PUT`/`DELETE /v1/alert_retrigger_rules/{id}`) and their schemas
- **BREAKING**: Bulk import endpoints (`POST /v1/bulk_imports` and `GET /v1/bulk_imports/{id}`) and their schemas

### Dependencies
- Updated `softprops/action-gh-release` from v3.0.2 to v3.0.3; Swift package dependencies unchanged
