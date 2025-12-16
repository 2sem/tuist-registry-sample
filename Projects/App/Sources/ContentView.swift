import SwiftUI
import ComposableArchitecture
import Kingfisher
import NetworkKit

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Tuist Registry Sample")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("This app demonstrates:")
                .font(.headline)

            VStack(alignment: .leading, spacing: 10) {
                FeatureRow(icon: "📦", text: "Registry-based dependencies")
                FeatureRow(icon: "🌐", text: "Alamofire (via NetworkKit)")
                FeatureRow(icon: "🏗️", text: "Composable Architecture")
                FeatureRow(icon: "🖼️", text: "Kingfisher image loading")
            }
            .padding()

            Spacer()

            Text("Bundle ID: sample.tuist.registry.app")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String

    var body: some View {
        HStack {
            Text(icon)
                .font(.title2)
            Text(text)
                .font(.body)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
