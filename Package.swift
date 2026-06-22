// swift-tools-version: 6.4

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("ApproachableConcurrency")
]

let package = Package(
    name: "jsUI",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "jsUI", targets: ["jsUI"]),
        .executable(name: "jsHost", targets: ["jsHost"]),
        .executable(name: "Demo", targets: ["Demo"]),
    ],
    targets: [
        .target(
            name: "jsUI",
            swiftSettings: swiftSettings + [.defaultIsolation(MainActor.self)],
        ),
        .executableTarget(
            name: "jsHost",
            dependencies: ["jsUI"],
            swiftSettings: swiftSettings,
        ),
        .executableTarget(
            name: "Demo",
            dependencies: ["jsUI"],
            path: "Demo",
            resources: [.process("app.js")],
            swiftSettings: swiftSettings,
        ),
    ],
    swiftLanguageModes: [.v6],
)
