//
//  ProfileListView.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 02/06/26.
//

import SwiftUI

struct ProfileListView: View {

    @State private var viewModel =
    ProfileListViewModel()
    
    @State private var networkMonitor =
       NetworkMonitor.shared
       
    
    private var filterSection: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(spacing: 12) {

                ForEach(ProfileFilter.allCases, id: \.self) { filter in

                    Button {
                            viewModel.selectedFilter = filter

                    } label: {

                        Text(filter.rawValue)
                            .font(.subheadline.bold())
                            .foregroundStyle(
                                viewModel.selectedFilter == filter
                                ? .white
                                : .primary
                            )
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(
                                viewModel.selectedFilter == filter
                                ? Color.accent
                                : Color.gray.opacity(0.12)
                            )
                            .clipShape(Capsule())
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    var body: some View {

        NavigationStack {
            
            ZStack(alignment: .bottom) {
                            
                            contentView
                            
                            if !networkMonitor.isConnected {
                                NoInternetBanner()
                                    .transition(
                                        .move(edge: .bottom)
                                        .combined(with: .opacity)
                                    )
                            }
                        }
                        .animation(
                            .easeInOut(duration: 0.3),
                            value: networkMonitor.isConnected
                        )
                        .navigationTitle(
                            AppStrings.matches
                        )
                        .task {
                            
                            await viewModel.fetchProfiles()
                        }
        }
    }
}


// MARK: - UI
private extension ProfileListView {
    
    @ViewBuilder
    var contentView: some View {
        
        if viewModel.isLoading {
            
            ProgressView(
                AppStrings.loadingProfiles
            )
            
        } else if let error =
                    viewModel.errorMessage {
            
            ContentUnavailableView(
                AppStrings.somethingWentWrong,
                systemImage: "wifi.exclamationmark",
                description: Text(error)
            )
            
        } else {
            
            VStack {
                
                filterSection
                
                profileListView
            }
        }
    }
    
    var profileListView: some View {
        Group{
            if viewModel.filteredProfiles.isEmpty{
                ContentUnavailableView(emptyTitle, systemImage: emptyImage )
            }else{
                ScrollView(
                    .vertical,
                    showsIndicators: false
                ) {
                    
                    LazyVStack(spacing: 24) {
                        
                        ForEach(
                            viewModel.filteredProfiles
                        ) { profile in
                            
                            NavigationLink {
                                
                                ProfileDetailsView(profile: profile)
                                
                            } label: {
                                
                                ProfileListRow(
                                    onAccept: {
                                        viewModel.acceptProfile(profile)
                                    },
                                    onDecline: {
                                        viewModel.declineProfile(profile)
                                    }, hideButtons: false,
                                    profile: profile
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical)
                }
            }
        }
    }
    
    // MARK: - Empty State
       
       var emptyTitle: String {
           
           switch viewModel.selectedFilter {
               
           case .all:
               return "No Pending Requests"
               
           case .accepted:
               return "No Accepted Requests"
               
           case .declined:
               return "No Declined Requests"
           }
       }
       
       var emptyImage: String {
           return "list.bullet.clipboard"
       }
}

#Preview {
    ProfileListView()

}
