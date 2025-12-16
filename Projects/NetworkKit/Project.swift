import ProjectDescription

let project = Project(
    name: "NetworkKit",
    targets: [
        .target(
            name: "NetworkKit",
            destinations: .iOS,
            product: .framework,
            bundleId: "sample.tuist.registry.networkkit",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                // Using registry packages via external dependencies
                .external(name: "Alamofire"),
            ]
        ),
        .target(
            name: "NetworkKitTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "sample.tuist.registry.networkkit.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "NetworkKit")
            ]
        )
    ]
)
