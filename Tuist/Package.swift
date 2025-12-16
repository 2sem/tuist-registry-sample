// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [:]
    )
#endif

let package = Package(
    name: "tuist-registry",
    dependencies: [
        // Registry-based dependencies - using registry identifiers instead of URLs
        // Format: {organization}.{repository}

        // Example: Alamofire networking library
        .package(id: "alamofire.alamofire", from: "5.9.0"),

        // Example: Composable Architecture
        .package(id: "pointfreeco.swift-composable-architecture", from: "1.0.0"),

        // Example: Kingfisher image loading library
        .package(id: "onevcat.kingfisher", from: "7.0.0"),

        // Traditional URL-based approach (commented out for comparison)
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.9.0"),
        // .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.0.0"),
        // .package(url: "https://github.com/onevcat/Kingfisher", from: "7.0.0"),

        // You can read more about registry: https://docs.tuist.dev/en/guides/features/registry
    ]
)
