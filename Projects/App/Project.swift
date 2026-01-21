import ProjectDescription

let project = Project(
    name: "App",
    packages: [
        .package(id: "pointfreeco.swift-composable-architecture", from: "1.0.0"),
        .package(id: "onevcat.kingfisher", from: "7.0.0"),
    ],
    targets: [
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "sample.tuist.registry.app",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                // Local framework dependency
                .project(target: "NetworkKit", path: "../NetworkKit"),

                // Registry package dependencies
                .package(product: "ComposableArchitecture"),
                .package(product: "Kingfisher"),
            ]
        ),
        .target(
            name: "AppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "sample.tuist.registry.app.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "App")
            ]
        ),
    ]
)
