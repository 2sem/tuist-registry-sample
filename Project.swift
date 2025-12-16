import ProjectDescription

let project = Project(
    name: "tuist-registry",
    targets: [
        .target(
            name: "tuist-registry",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.tuist-registry",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "tuist-registry/Sources",
                "tuist-registry/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "tuist-registryTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.tuist-registryTests",
            infoPlist: .default,
            buildableFolders: [
                "tuist-registry/Tests"
            ],
            dependencies: [.target(name: "tuist-registry")]
        ),
    ]
)
