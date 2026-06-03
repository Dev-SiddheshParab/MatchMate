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
    
    private var filterSection: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(spacing: 12) {

                ForEach(ProfileFilter.allCases, id: \.self) { filter in

                    Button {

                        withAnimation {

                            viewModel.selectedFilter = filter
                        }

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

            VStack {

                if viewModel.isLoading {
                    ProgressView(AppStrings.loadingProfiles)
                } else if let error =
                            viewModel.errorMessage {
                    ContentUnavailableView(
                        AppStrings.somethingWentWrong,
                        systemImage: "wifi.exclamationmark",
                        description: Text(error)
                    )
                } else {
                    filterSection
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 24) {
                            ForEach(viewModel.filteredProfiles    ) { profile in
                                
                                NavigationLink {
                                        
                                        ProfileDetailsView()
                                        
                                    } label: {
                                        
                                        ProfileListRow(
                                            onAccept: {
                                                viewModel.acceptProfile(profile)
                                            },
                                            onDecline: {
                                                viewModel.declineProfile(profile)
                                            },
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
            .navigationTitle(AppStrings.matches)
            .task {

                await viewModel.fetchProfiles()
            }
        }
    }
}

#Preview {
    ProfileListView()

}

//struct AlternateProfileRowView: View {
//    let onAccept: () -> Void
//    let onDecline: () -> Void
//
//    let profile: ProfileEntity
//    var body: some View {
//        
//        ZStack(alignment: .bottom){
//            WebImage(
//                url: URL(string: profile.imageURL ?? "")
//            )
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .clipped()
//            .frame(width: UIScreen.main.bounds.width - 40)
//            .frame(height: UIScreen.main.bounds.height * 0.5)
//            
//            LinearGradient(colors: [.clear,.black], startPoint: .top, endPoint: .bottom)
//            
//            VStack(alignment: .leading) {
//                Text("\(profile.name ?? ""), 32")
//                    .font(.title)
//                    .fontWeight(.medium)
//                    .foregroundStyle(.white)
//                Text("4ft 10in • Navi Mumbai")
//                    .font(.default)
//                    .foregroundStyle(.white.opacity(0.95))
//            
//                
//                
//                if profile.status != "accepted"{
//                    Button {
//                        
//                        // Decline Action
//                        onAccept()
//                        
//                    } label: {
//                        
//                        Text("Connect Now")
//                            .font(.default)
//                            .foregroundStyle(.accent)
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 4)
//                            .background(
//                                RoundedRectangle(cornerRadius: 8)
//                                    .stroke(Color.accent, lineWidth: 1.5)
//                            )
//                    }
//                }else if profile.status == "declined"{
//                    Button {
//                        
//                        // Decline Action
//                        onAccept()
//                    } label: {
//                        
//                        Text("Changed Your Mind? Accept Now")
//                            .font(.default)
//                            .foregroundStyle(.green)
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 4)
//                            .background(
//                                RoundedRectangle(cornerRadius: 8)
//                                    .stroke(Color.green, lineWidth: 1.5)
//                            )
//                    }
//                }else{
//                    HStack(spacing: 16) {
//                        
//                        Button {
//                            
//                            // Decline Action
//                            onDecline()
//                        } label: {
//                            
//                            Text("Decline")
//                                .font(.default)
//                                .foregroundStyle(.gray)
//                                .frame(maxWidth: .infinity)
//                                .padding(.vertical, 4)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 8)
//                                        .stroke(Color.gray, lineWidth: 1.5)
//                                )
//                        }
//                        
//                        Button {
//                            
//                            // Accept Action
//                            onAccept()
//                        } label: {
//                            
//                            Text("Accept")
//                                .font(.default)
//                                .foregroundStyle(.green)
//                                .frame(maxWidth: .infinity)
//                                .padding(.vertical, 4)
//                                .background(
//                                    RoundedRectangle(cornerRadius: 8)
//                                        .stroke(Color.green, lineWidth: 1.5)
//                                )
//                        }
//                    }
//                }
//            }
//            .padding()
//        
//        }
//        .clipShape(RoundedRectangle(cornerRadius: 16))
//        .overlay {
//            RoundedRectangle(cornerRadius: 16)
//                .stroke(
//                    LinearGradient(
//                        colors: [
//                            .black,
//                            .black
//                        ],
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    ),
//                    lineWidth: 2
//                )
//        }
//        .padding()
//       
//    }
//}



//
//struct ProfileRowView: View {
//
//    let onAccept: () -> Void
//    let onDecline: () -> Void
//    
//    let profile: ProfileEntity
//    let height:CGFloat = 500
//    var body: some View {
//
//        VStack(alignment: .center) {
//            
//            // MARK: - Background Image
//            
//           
//            //                .clipped()
//            //
//            //            // MARK: - Dark Gradient Overlay
//            //
//            //            LinearGradient(
//            //                colors: [
//            //                    .clear,
//            //                    .black.opacity(0.2),
//            //                    .black.opacity(0.85)
//            //                ],
//            //                startPoint: .top,
//            //                endPoint: .bottom
//            //            )
//            
//            // MARK: - Content
//            
//            
//               
//            VStack(alignment: .leading, spacing: 16) {
//                
//                // MARK: - Profile Info
//                WebImage(
//                    url: URL(string: profile.imageURL ?? "")
//                )
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(height: 180)
//                .clipped()
//                VStack(alignment: .leading, spacing: 12) {
//                    
//                    HStack {
//                        
//                        //                        Text("Pro Max")
//                        //                            .font(.subheadline.bold())
//                        //                            .foregroundStyle(.black)
//                        //                            .padding(.horizontal, 16)
//                        //                            .padding(.vertical, 8)
//                        //                            .background(
//                        //                                LinearGradient(
//                        //                                    colors: [
//                        //                                        .orange,
//                        //                                        .pink
//                        //                                    ],
//                        //                                    startPoint: .leading,
//                        //                                    endPoint: .trailing
//                        //                                )
//                        //                            )
//                        //                            .clipShape(Capsule())
//                        
////                        Text("Last seen today")
////                            .font(.subheadline)
////                            .foregroundStyle(.black.opacity(0.9))
//                    }
//                    
//                    Text("\(profile.name ?? ""), 32")
//                        .font(.title)
//                        .fontWeight(.medium)
//                        .foregroundStyle(.black)
//                    
//                    Text("4ft 10in • Navi Mumbai")
//                        .font(.title3)
//                        .foregroundStyle(.black.opacity(0.95))
//                    
//                    Text("HR Professional • MBA/PGDM")
//                        .font(.headline)
//                        .foregroundStyle(.black.opacity(0.95))
//                    
//                    // Managed By
//                    
//                    //                    Text("Profile managed by Parent")
//                    //                        .font(.subheadline.bold())
//                    //                        .foregroundStyle(.black)
//                    //                        .padding()
//                    //                        .frame(maxWidth: .infinity, alignment: .leading)
//                    //                        .background(.white.opacity(0.12))
//                    //                        .clipShape(RoundedRectangle(cornerRadius: 14))
//                }
//                .padding(16)
//                // MARK: - Action Buttons
//                
//                HStack(spacing: 40) {
//                    
//                    VStack(spacing: 10) {
//                        
//                        Button {
//                            onDecline()
//                        } label: {
//                            
//                            Circle()
//                                .fill(.gray.opacity(0.2))
//                                .frame(width: 82, height: 82)
//                                .overlay {
//                                    
//                                    Image(systemName: "xmark")
//                                        .font(.system(size: 28, weight: .bold))
//                                        .foregroundStyle(.black)
//                                }
//                        }
//                        
//                        Text("Decline")
//                            .font(.headline.bold())
//                            .foregroundStyle(.black)
//                    }
//                    
//                    Spacer()
//                    
//                    VStack(spacing: 10) {
//                        
//                        Button {
//                            onAccept()
//                        } label: {
//                            
//                            Circle()
//                                .fill(.green.opacity(0.85))
//                                .frame(width: 82, height: 82)
//                                .overlay {
//                                    
//                                    Image(systemName: "checkmark")
//                                        .font(.system(size: 30, weight: .bold))
//                                        .foregroundStyle(.black)
//                                }
//                        }
//                        
//                        Text("Accept Interest")
//                            .font(.headline.bold())
//                            .foregroundStyle(.black)
//                    }
//                }
//            }
//            .padding(0)}
//        .clipShape(RoundedRectangle(cornerRadius: 16))
//        .overlay {
//
//            RoundedRectangle(cornerRadius: 16)
//                .stroke(
//                    LinearGradient(
//                        colors: [
//                            .prm,
//                            .scnd
//                        ],
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    ),
//                    lineWidth: 4
//                )
//        }
//        .padding()
//    }
//}
