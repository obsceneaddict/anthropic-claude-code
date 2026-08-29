# Auranomics — iOS MVP

Gen Z "aura points" tracker. Log a moment, get an instant animated aura score,
build a streak, share a branded Aura Card. Full product/business plan lives in
[`docs/STRATEGY.md`](../../docs/STRATEGY.md) at the repo root.

## What's here

Plain SwiftUI source files (no `.xcodeproj` checked in — generating a valid
Xcode project file by hand is fragile; creating one fresh in Xcode and
dragging these folders in is faster and safer). Everything below is real,
compiling SwiftUI/Swift — not pseudocode.

## Run it in Xcode (5 minutes)

1. Open Xcode → **File → New → Project → iOS → App**.
2. Product Name: `Auranomics`. Interface: **SwiftUI**. Language: **Swift**.
   Uncheck "Use Core Data" / "Include Tests" (add tests later if you want).
   Bundle identifier suggestion: `com.codeofreality.auranomics`.
3. Set **Minimum Deployments → iOS 17.0**.
4. Delete the default `ContentView.swift` and `Item.swift` (if generated)
   Xcode created for you.
5. In Finder, drag the entire `Auranomics/` subfolder from this repo
   (the one containing `AuranomicsApp.swift`, `Models/`, `Views/`, etc.)
   into your Xcode project navigator, **replacing** the app's root folder.
   Check "Copy items if needed" and "Create groups". Also drag in
   `Auranomics.storekit` (sits next to this README) — needed for local
   IAP testing, see the StoreKit Configuration step below.
6. Delete the placeholder `Assets.xcassets` Xcode generated, keep the one
   from this repo (or merge — you'll want to add a real 1024×1024 app icon
   into `AppIcon.appiconset` before shipping; `Contents.json` is already set up).
7. Build & run (⌘R) on an iPhone 15/16 simulator, iOS 17+.

You should land on the onboarding flow, then the Home tab with a seeded
"Downloaded Auranomics +1000" event already in today's timeline.

## Before TestFlight / App Store submission

- [ ] Add a real app icon (1024×1024 PNG, no alpha) to `AppIcon.appiconset`.
- [ ] In **Signing & Capabilities**, set your team and let Xcode manage signing.
- [ ] `Services/PaywallStore.swift` already uses real StoreKit 2 (`Product.products`,
      `purchase()`, `Transaction.currentEntitlements`/`updates`) — no mock to replace.
      For local testing before App Store Connect products exist, select
      `Auranomics.storekit` under Product → Scheme → Edit Scheme → Options →
      StoreKit Configuration.
- [ ] Create the 3 IAP products in App Store Connect matching the identifiers
      in `Support/Constants.swift` (`Constants.IAP`) and get them to
      "Ready to Submit" status before submitting the app for review.
- [ ] Publish real Privacy Policy / Terms pages and update
      `Constants.Links` — the in-app "Settings → Privacy/Terms" screens
      currently show a `DO WERYFIKACJI` placeholder pointing here.
- [ ] Wire `Services/AnalyticsService.swift` to a real analytics SDK if you
      want funnel data beyond console logs (TelemetryDeck is the lowest-friction,
      privacy-nutrition-label-friendly option for a solo dev).
- [ ] Swap the placeholder bundle ID / company name if `com.codeofreality`
      isn't the entity you're shipping under.

## Architecture

MVVM, zero third-party dependencies, zero backend:

- **Models/** — `AuraEvent`, `AuraCategory`, `AuraTier` (plain Codable structs/enums)
- **Data/** — `PresetEventLibrary` (curated quick-log events)
- **Services/** — `AuraRepository` (JSON-file persistence + derived stats),
  `AuraScoringEngine` (rule-based, on-device scorer for free-text entries),
  `PaywallStore` (entitlement + mock IAP, StoreKit2-ready), `HapticsService`,
  `ShareImageRenderer`, `AnalyticsService`
- **ViewModels/** — `@Observable` classes per screen, own all business logic
- **Views/** — SwiftUI screens, grouped by feature folder

No login, no network calls, no third-party SDKs. All data stays on-device
in `Documents/aura_events.json`.
