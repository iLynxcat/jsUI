// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "jsUI",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "jsUI",
            targets: ["jsUI"]
        ),
        .executable(
            name: "jsHost",
            targets: ["jsHost"],
        ),
    ],
    targets: [
        .target(
            name: "jsUI",
            path: "jsUI",
            swiftSettings: [
                .defaultIsolation(MainActor.self),
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
        .executableTarget(
            name: "jsHost",
            dependencies: [
                .target(name: "jsUI")
            ],
            path: "jsHost",
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency")
            ],
        ),
    ],
    swiftLanguageModes: [.v6],
)
