// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TCATabViewSetup",
    platforms: [.iOS("18.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Root",
            targets: ["Root"]),
        .library(
            name: "Tabs",
            targets: ["Tabs"]),
        .library(
            name: "Home",
            targets: ["Home"]),
        .library(
            name: "Settings",
            targets: ["Settings"]),
    ],
    dependencies: [.package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.14.0"),],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Root",
            dependencies: [
                "Tabs",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "RootTests",
            dependencies: ["Root"]
        ),
        .target(
            name: "Tabs",
            dependencies: [
                "Home",
                "Settings",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "TabsTests",
            dependencies: ["Tabs"]
        ),
        .target(
            name: "Home",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]
        ),
        .target(
            name: "Settings",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "SettingsTests",
            dependencies: ["Settings"]
        ),
    ]
)
