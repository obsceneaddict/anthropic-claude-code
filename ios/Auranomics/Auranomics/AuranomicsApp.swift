import SwiftUI

@main
struct AuranomicsApp: App {
    @AppStorage("auranomics.hasOnboarded") private var hasOnboarded = false

    @State private var repository = AuraRepository()
    @State private var paywall = PaywallStore()

    var body: some Scene {
        WindowGroup {
            Group {
                if hasOnboarded {
                    RootTabView(repository: repository, paywall: paywall)
                } else {
                    OnboardingView()
                }
            }
            .animation(.easeInOut, value: hasOnboarded)
        }
    }
}
