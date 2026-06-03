//
//  MatchMateApp.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 02/06/26.
//

import SwiftUI
import Observation

@main
struct MatchMateApp: App {
    
    @State private var appState = AppState()

    
    var body: some Scene {
        WindowGroup {
            if appState.hasSeenOnboarding {
                HomeView()
            } else {
                OnboardingView()
            }
        }
        .environment(appState)
    }
}

@Observable
final class AppState {

    var hasSeenOnboarding: Bool {
        didSet {
            UserDefaults.standard.set(
                hasSeenOnboarding,
                forKey: "hasSeenOnboarding"
            )
        }
    }

    init() {
        self.hasSeenOnboarding =
            UserDefaults.standard.bool(
                forKey: "hasSeenOnboarding"
            )
    }
}
