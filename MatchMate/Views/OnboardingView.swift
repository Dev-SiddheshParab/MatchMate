//
//  OnboardingView.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 02/06/26.
//

import SwiftUI

struct OnboardingView: View {

    @Environment(AppState.self)
    private var appState
    
    @State private var currentIndex = 0
        @State private var animateImage = false

        let images = [
            "onboarding2",
            "onboarding1",
            "onboarding3"
        ]

    var body: some View {

        VStack(spacing: 0) {

            // Top Image
            ZStack(alignment: .bottom) {
                
                Image(images[currentIndex])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: UIScreen.main.bounds.height * 0.55)
                                    .scaleEffect(animateImage ? 1.05 : 1.0)
                                    .offset(y: animateImage ? -8 : 0)
                                    .animation(
                                        .easeInOut(duration: 4)
                                        .repeatForever(autoreverses: true),
                                        value: animateImage
                                    )
                                    .transition(.opacity)
                                    .id(currentIndex)
                                    .clipped()

                LinearGradient(
                    colors: [.clear, .white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 180)
            }
            .onAppear {

                           animateImage = true

                           Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in

                               withAnimation(.easeInOut(duration: 2)) {

                                   currentIndex =
                                   (currentIndex + 1) % images.count
                               }
                           }
                       }

            // Bottom Content
            VStack(spacing: 8) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)

                Text("Find Your Special Someone")
                    .font(.title.bold())
                    .foregroundStyle(Color.accent)
                    .multilineTextAlignment(.center)
                    .padding(.top,30)

                Text("India's Most Preferred and Trusted Service for Finding a Life-Partner.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)

                Spacer()

                Button {
                    appState.hasSeenOnboarding = true
                } label: {

                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.accent)
                        .cornerRadius(18)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, -40)
//            .padding(.bottom, 8)
        }
        .ignoresSafeArea(edges: .top)
        .background(Color.white)
    }
}

#Preview {
    OnboardingView()
        .environment(AppState())
}
