# rootly-swift

Swift client for the [Rootly](https://rootly.com) incident management platform, auto-generated from OpenAPI specifications using [Apple's Swift OpenAPI Generator](https://github.com/apple/swift-openapi-generator).

## Installation

Add the dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/rootlyhq/rootly-swift.git", from: "1.0.0"),
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

## Getting Your API Key

1. Navigate to **Organization dropdown** > **Organization Settings** > **API Keys**
2. Generate a new API key
3. Use the token in your client configuration

## Usage

```swift
import Rootly

let client = makeClient(token: "YOUR_API_TOKEN")
```

### List Incidents

```swift
let response = try await client.listIncidents()

switch response {
case .ok(let ok):
    let incidents = try ok.body.applicationVnd_apiJson
    for incident in incidents.data ?? [] {
        print(incident.attributes?.title ?? "Untitled")
    }
default:
    print("Request failed")
}
```

### Filter Incidents

```swift
let response = try await client.listIncidents(
    query: .init(
        filter_lbrack_status_rbrack_: "started",
        filter_lbrack_severity_rbrack_: "sev0"
    )
)
```

### Get a Single Incident

```swift
let response = try await client.getIncident(
    path: .init(id: .init(value1: "YOUR_INCIDENT_UUID"))
)

switch response {
case .ok(let ok):
    let incident = try ok.body.applicationVnd_apiJson
    print(incident.data?.attributes?.title ?? "")
default:
    print("Not found")
}
```

### Create an Incident

```swift
let response = try await client.createIncident(
    body: .applicationVnd_apiJson(.init(
        data: .init(
            _type: .incidents,
            attributes: .init(
                title: "Database connection pool exhausted",
                summary: "Primary database connection pool at 100% capacity",
                kind: .normal,
                severityId: "YOUR_SEVERITY_UUID"
            )
        )
    ))
)

switch response {
case .created(let created):
    let incident = try created.body.applicationVnd_apiJson
    print("Created: \(incident.data?.id ?? "")")
default:
    print("Failed to create")
}
```

### Update an Incident

```swift
let response = try await client.updateIncident(
    path: .init(id: .init(value1: "YOUR_INCIDENT_UUID")),
    body: .applicationVnd_apiJson(.init(
        data: .init(
            _type: .incidents,
            attributes: .init(
                status: "mitigated",
                summary: "Connection pool scaled up, requests recovering"
            )
        )
    ))
)
```

### List Services

```swift
let response = try await client.listServices()

switch response {
case .ok(let ok):
    let services = try ok.body.applicationVnd_apiJson
    for service in services.data ?? [] {
        print(service.attributes?.name ?? "")
    }
default:
    break
}
```

### Custom Server URL

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

### Prerequisites

- Swift 6.0 or later
- Xcode 16+ or equivalent Swift toolchain

### Commands

```bash
make fetch-spec    # Download latest OpenAPI spec
make build         # Build the package
make test          # Run tests
make lint          # Run SwiftLint
```

### Generating the Code

The SDK uses Apple's swift-openapi-generator as a build plugin. Code generation happens automatically at build time from `Sources/Rootly/openapi.json`. To update the spec:

```bash
make fetch-spec
make build
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for development guidelines.

## Licence

[MIT](LICENCE) - Copyright 2026 Rootly Inc.
