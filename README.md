# Rootly Swift SDK

A Swift client for the [Rootly API](https://rootly.com/api), generated using [Apple's Swift OpenAPI Generator](https://github.com/apple/swift-openapi-generator).

## Installation

Add the dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/rootly/rootly-swift.git", from: "1.0.0"),
]
```

Then add `Rootly` to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "Rootly", package: "rootly-swift"),
    ]
)
```

## Usage

```swift
import Rootly

let client = makeClient(token: "YOUR_API_TOKEN")

// List incidents
let response = try await client.listIncidents()

// Get a specific incident
let incident = try await client.getIncident(path: .init(id: "incident-id"))
```

## Authentication

All requests require a Rootly API token. Generate one from **Organization Settings > API Keys** in your Rootly dashboard.

```swift
let client = makeClient(token: "YOUR_API_TOKEN")
```

To use a custom server URL:

```swift
let client = makeClient(
    token: "YOUR_API_TOKEN",
    serverURL: URL(string: "https://your-instance.rootly.com")!
)
```

## API Documentation

- [Rootly API Reference](https://docs.rootly.com/api-reference/overview)
- [JSON:API Specification](https://jsonapi.org)

## Development

```bash
# Fetch latest OpenAPI spec
make fetch-spec

# Build
make build

# Run tests
make test
```

## Licence

[MIT](LICENCE) - Copyright 2026 Rootly Inc.
