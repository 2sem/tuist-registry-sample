import ProjectDescription

let tuist = Tuist(
    // Configure your project's full handle for Tuist Cloud features
    // Uncomment and set your organization/project name
    // fullHandle: "your-org/tuist-registry-sample",

    project: .tuist(
        // Enable generation options for registry support
        generationOptions: .options(
            // Optional: Enable caching for faster builds
            // enableCaching: true
            // Eleminate 'tuist registry setup'
            // registryEnabled: true
        )
    )
)

// To use Tuist Registry:
// 1. Run: tuist registry setup
// 2. (Optional) Run: tuist registry login for higher rate limits
// 3. Use registry identifiers in Tuist/Package.swift (format: {org}.{repo})
// 4. Generate your project: tuist generate
