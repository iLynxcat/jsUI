// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "jsUI",
	platforms: [.macOS(.v27)],
	products: [
		.executable(
			name: "jsUI",
			targets: ["jsUI"]
		)
	],
	targets: [
		// Targets are the basic building blocks of a package, defining a module or a test suite.
		// Targets can depend on other targets in this package and products from dependencies.
		.executableTarget(
			name: "jsUI",
			swiftSettings: [
                .defaultIsolation(MainActor.self),
				.enableUpcomingFeature("ApproachableConcurrency")
			],
		)
	],
	swiftLanguageModes: [.v6]
)
