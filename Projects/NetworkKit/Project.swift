import ProjectDescription

let project = Project(
    name: "NetworkKit",
    packages: [
        .package(id: "alamofire.alamofire", from: "5.9.0"),
    ],
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
                .package(product: "Alamofire"),
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
