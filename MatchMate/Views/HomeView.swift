//
//  HomeView.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 02/06/26.
//

import SwiftUI



struct HomeView: View {
    @Environment(AppState.self)
        private var appState

    var body: some View {
                ProfileListView()
    }
}

#Preview {
    HomeView()
        .environment(AppState())
}
