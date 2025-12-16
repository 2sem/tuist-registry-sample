# Tuist Registry Sample

This project demonstrates how to use **Tuist Registry** for faster and more efficient Swift Package dependency resolution.

## What is Tuist Registry?

Tuist Registry addresses performance issues with Swift Package Manager by allowing you to **download only the commits you actually need**, instead of cloning entire repositories. Packages are sourced from the Swift Package Index and distributed globally using edge storage for minimal latency.

## Project Structure

```
tuist-registry/
├── Tuist.swift                  # Tuist configuration
├── Workspace.swift              # Workspace definition
├── Tuist/
│   └── Package.swift           # Registry dependencies
└── Projects/
    ├── App/                    # Main iOS app
    │   ├── Project.swift
    │   ├── Sources/
    │   │   ├── AppDelegate.swift
    │   │   └── ContentView.swift
    │   ├── Resources/
    │   └── Tests/
    └── NetworkKit/             # Networking framework
        ├── Project.swift
        ├── Sources/
        │   └── NetworkClient.swift
        └── Tests/
            └── NetworkClientTests.swift
```

## Key Features Demonstrated

### 1. Registry Identifiers (Tuist/Package.swift:22-28)

Uses registry identifiers instead of URLs:

```swift
.package(id: "alamofire.alamofire", from: "5.9.0")           // ✅ Registry
// .package(url: "https://github.com/Alamofire/Alamofire")   // ❌ Old way
```

Format: `{organization}.{repository}`

**Examples:**
- `https://github.com/pointfreeco/swift-composable-architecture` → `pointfreeco.swift-composable-architecture`
- `https://github.com/Alamofire/Alamofire` → `alamofire.alamofire`
- `https://github.com/onevcat/Kingfisher` → `onevcat.kingfisher`

### 2. External Dependencies in Projects

**NetworkKit** (Projects/NetworkKit/Project.swift:14):
```swift
dependencies: [
    .external(name: "Alamofire"),
]
```

**App** (Projects/App/Project.swift:22-27):
```swift
dependencies: [
    .project(target: "NetworkKit", path: "../NetworkKit"),  // Local framework
    .external(name: "ComposableArchitecture"),             // Registry package
    .external(name: "Kingfisher"),                         // Registry package
]
```

## Getting Started

### Prerequisites

Make sure you have Tuist installed:
```bash
curl -Ls https://install.tuist.io | bash
```

### 1. Setup Registry

**IMPORTANT:** Run this command first in the project directory:

```bash
tuist registry setup
```

This creates a registry configuration file (should be committed to git).

### 2. (Optional) Authenticate

For higher rate limits (20,000 vs 1,000 requests/minute):

```bash
tuist registry login
```

*Note: Requires a Tuist account and project.*

### 3. Install Dependencies

```bash
tuist install
```

### 4. Generate Project

```bash
tuist generate
```

### 5. Open Workspace

```bash
open TuistRegistrySample.xcworkspace
```

## Rate Limits

- **Without authentication**: 1,000 requests/minute per IP
- **With authentication**: 20,000 requests/minute

## Bundle IDs

All targets use the prefix `sample.tuist.registry`:

- App: `sample.tuist.registry.app`
- AppTests: `sample.tuist.registry.app.tests`
- NetworkKit: `sample.tuist.registry.networkkit`
- NetworkKitTests: `sample.tuist.registry.networkkit.tests`

## Dependencies Used

This sample includes the following registry packages:

- **Alamofire** (5.9.0) - HTTP networking library
- **Composable Architecture** (1.0.0) - State management framework
- **Kingfisher** (7.0.0) - Image downloading and caching

## Learn More

- [Tuist Registry Guide](https://docs.tuist.dev/en/guides/features/registry)
- [Registry Generated Projects](https://docs.tuist.dev/en/guides/features/registry/generated-project)
- [Swift Package Index](https://swiftpackageindex.com)

## Troubleshooting

### "no registry configured for 'scope'" error

If you encounter this error:
1. Make sure you ran `tuist registry setup` first
2. Some packages may not be available in the registry yet - use URL-based dependencies as fallback
3. Check that the package exists on [Swift Package Index](https://swiftpackageindex.com)

### Registry not working

1. Verify registry setup: `cat .tuist-registry`
2. Try authenticating: `tuist registry login`
3. Clear cache: `tuist clean`

## Notes

- If a repository name contains a dot, it's replaced with an underscore in the registry identifier (e.g., `groue.GRDB_swift`)
- Registry packages are cached globally for faster subsequent resolutions
- The traditional URL-based approach still works but is slower
- Always run `tuist registry setup` before `tuist install`
