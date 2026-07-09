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
        static let privacyPolicy = URL(string: "https://auranomics.app/privacy")!
        static let termsOfUse = URL(string: "https://auranomics.app/terms")!
        static let support = URL(string: "https://auranomics.app/support")!
    }

    static let appGroupSuggestedForWidget = "group.com.codeofreality.auranomics"
}
