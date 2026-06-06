// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "rootly-swift",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "Rootly", targets: ["Rootly"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator.git", from: "1.12.2"),
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.12.0"),
        .package(url: "https://github.com/apple/swift-openapi-urlsession.git", from: "1.3.0"),
    ],
    targets: [
        .target(
            name: "Rootly",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
            ],
            path: "Sources/Rootly",
            exclude: ["openapi.json", "openapi-generator-config.yaml"]
        ),
        .testTarget(
            name: "RootlyTests",
            dependencies: ["Rootly"]
        ),
    ]
)
