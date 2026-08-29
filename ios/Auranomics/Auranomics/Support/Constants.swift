import Foundation

enum Constants {
    enum IAP {
        // Match these exactly to the product identifiers you create in App Store Connect.
        static let monthly = "com.codeofreality.auranomics.pro.monthly"
        static let yearly = "com.codeofreality.auranomics.pro.yearly"
        static let lifetime = "com.codeofreality.auranomics.pro.lifetime"
    }

    enum Limits {
        /// Free-tier custom (free-text) entries allowed per calendar day.
        static let freeCustomEntriesPerDay = 3
        static let freeHistoryDays = 7
    }

    enum Links {
        // Source for these pages: docs/site/*.html. Hosted via GitHub Pages by default —
        // swap to a custom domain any time by editing only these three lines.
        static let privacyPolicy = URL(string: "https://obsceneaddict.github.io/anthropic-claude-code/site/privacy.html")!
        static let termsOfUse = URL(string: "https://obsceneaddict.github.io/anthropic-claude-code/site/terms.html")!
        static let support = URL(string: "https://obsceneaddict.github.io/anthropic-claude-code/site/support.html")!
    }

    static let appGroupSuggestedForWidget = "group.com.codeofreality.auranomics"
}
