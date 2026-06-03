//
//  ProfileDetailsView.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 02/06/26.
//

import SwiftUI

//struct ProfileDetailsView: View {
//    
//    var profile: ProfileEntity
//    
//    var body: some View {
//        
//        ScrollView(
//                    .vertical,
//                    showsIndicators: false
//        ) {
//            
//            VStack{
//                ProfileListRow(onAccept: {}, onDecline: {}, hideButtons: true, profile: profile)
//    
//                VStack{
//                    
//                    Group{
//                        aboutSection
//                        personalInfoSection
//                    }
//                    .shadow(
//                        color: .black.opacity(0.8),
//                        radius: 10,
//                        x: 0,
//                        y: 6
//                    )
//                   
//
//                }
//                .padding(.horizontal)
//            }
//            
//        }
//        .background(.gray.opacity(0.2))
//
//        
//
//    }
//}
//
//// MARK: - About Section
//
//private extension ProfileDetailsView {
//    
//    var aboutSection: some View {
//        
//        VStack(
//            alignment: .leading,
//            spacing: 16
//        ) {
//            
//            Text("About")
//                .font(.title3.bold())
//            
//            Text(
//                """
//                Hi, I’m \(profile.name ?? "Unknown"). I enjoy meaningful conversations, traveling, and building genuine connections.
//                """
//            )
//            .font(.body)
//            .foregroundStyle(.secondary)
//        }
//        .frame(
//            maxWidth: .infinity,
//            alignment: .leading
//        )
//        .padding()
//        .background(.white)
//        .clipShape(
//            RoundedRectangle(
//                cornerRadius: 20
//            )
//        )
//    }
//}
//
//private extension ProfileDetailsView {
//    
//    var personalInfoSection: some View {
//        
//        VStack(
//            alignment: .leading,
//            spacing: 20
//        ) {
//            
//            Text("Personal Info")
//                .font(.title3.bold())
//            
//            VStack(spacing: 16) {
//                
//                DetailRowView(
//                    title: "Name",
//                    value: profile.name ?? "-"
//                )
//                
//                DetailRowView(
//                    title: "Phone",
//                    value: profile.phone ?? "-"
//                )
//                
//                DetailRowView(
//                    title: "Status",
//                    value: profile.status ?? "-"
//                )
//                
//                DetailRowView(
//                    title: "Profile ID",
//                    value: "#\(profile.id)"
//                )
//                
//                DetailRowView(
//                           title: "Height",
//                           value: "5'7\""
//                       )
//                       
//                       DetailRowView(
//                           title: "Profession",
//                           value: "iOS Developer"
//                       )
//                       
//                       DetailRowView(
//                           title: "Education",
//                           value: "B.Tech Computer Science"
//                       )
//                       
//                       DetailRowView(
//                           title: "Religion",
//                           value: "Hindu"
//                       )
//                       
//                       DetailRowView(
//                           title: "Location",
//                           value: "Mumbai, India"
//                       )
//                       
//                       DetailRowView(
//                           title: "Language",
//                           value: "English, Hindi"
//                       )
//                       
//                       DetailRowView(
//                           title: "Marital Status",
//                           value: "Never Married"
//                       )
//                       
//                       DetailRowView(
//                           title: "Annual Income",
//                           value: "₹12 LPA"
//                       )
//                       
//                       DetailRowView(
//                           title: "Hobbies",
//                           value: "Traveling, Music, Gym"
//                       )
//            }
//            
//        }
//        .frame(
//            maxWidth: .infinity,
//            alignment: .leading
//        )
//        .padding()
//        .background(.white)
//        .clipShape(
//            RoundedRectangle(
//                cornerRadius: 20
//            )
//        )
//    }
//}
//
//
//struct DetailRowView: View {
//    
//    let title: String
//    
//    let value: String
//    
//    var body: some View {
//        
//        HStack {
//            
//            Text(title)
//                .foregroundStyle(.secondary)
//            
//            Spacer()
//            
//            Text(value)
//                .fontWeight(.medium)
//        }
//        .padding(.vertical, 4)
//    }
//}

import SwiftUI

struct ProfileDetailsView: View {
    
    let profile: ProfileEntity
    
    var body: some View {
        
        ScrollView(
            .vertical,
            showsIndicators: false
        ) {
            
            VStack(spacing: 20) {
                
                profileHeaderView
                
                detailsContainerView
            }
            .padding(.bottom)
        }
        .background(
            Color(.systemGroupedBackground)
        )
        .navigationTitle("Profile Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - UI

private extension ProfileDetailsView {
    
    var profileHeaderView: some View {
        
        ProfileListRow(
            onAccept: {},
            onDecline: {},
            hideButtons: true,
            profile: profile
        )
    }
    
    var detailsContainerView: some View {
        
        VStack(spacing: 20) {
            
            aboutSection
            
            personalInfoSection
        }
        .padding(.horizontal)
    }
}

// MARK: - About Section

private extension ProfileDetailsView {
    
    var aboutSection: some View {
        
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            
            Text("About")
                .font(.title3.bold())
            
            Text(
                """
                Hi, I’m \(profile.name ?? "Unknown"). I enjoy meaningful conversations, traveling, fitness, and building genuine connections with like-minded people.
                """
            )
            .font(.body)
            .foregroundStyle(.secondary)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding()
        .background(.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 12,
            x: 0,
            y: 8
        )
    }
}

// MARK: - Personal Info Section
private extension ProfileDetailsView {
    
    var personalInfoSection: some View {
        
        VStack(
            alignment: .leading,
            spacing: 20
        ) {
            
            Text("Personal Info")
                .font(.title3.bold())
            
            VStack(spacing: 16) {
                
                DetailRowView(
                    icon: "person.fill",
                    title: "Name",
                    value: profile.name ?? "-"
                )
                
                DetailRowView(
                    icon: "phone.fill",
                    title: "Phone",
                    value: profile.phone ?? "-"
                )
                
                DetailRowView(
                    icon: "checkmark.seal.fill",
                    title: "Status",
                    value: profile.status ?? "-"
                )
                
                DetailRowView(
                    icon: "number.square.fill",
                    title: "Profile ID",
                    value: "#\(profile.id)"
                )
                
                DetailRowView(
                    icon: "ruler.fill",
                    title: "Height",
                    value: "5'7\""
                )
                
                DetailRowView(
                    icon: "briefcase.fill",
                    title: "Profession",
                    value: "iOS Developer"
                )
                
                DetailRowView(
                    icon: "graduationcap.fill",
                    title: "Education",
                    value: "B.Tech Computer Science"
                )
                
                DetailRowView(
                    icon: "building.columns.fill",
                    title: "Religion",
                    value: "Hindu"
                )
                
                DetailRowView(
                    icon: "location.fill",
                    title: "Location",
                    value: "Mumbai, India"
                )
                
                DetailRowView(
                    icon: "globe",
                    title: "Language",
                    value: "English, Hindi"
                )
                
                DetailRowView(
                    icon: "heart.fill",
                    title: "Marital Status",
                    value: "Never Married"
                )
                
                DetailRowView(
                    icon: "indianrupeesign.circle.fill",
                    title: "Annual Income",
                    value: "₹12 LPA"
                )
                
                DetailRowView(
                    icon: "music.note.list",
                    title: "Hobbies",
                    value: "Traveling, Music, Gym"
                )
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding()
        .background(.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 12,
            x: 0,
            y: 8
        )
    }
}

// MARK: - Detail Row View

struct DetailRowView: View {
    let icon: String
    let title: String
    
    let value: String
    
    var body: some View {
        
        HStack {
            
            Image(systemName: icon)
                           .font(.headline)
                           .foregroundStyle(.accent)
                           .frame(width: 24)
            
            Text(title)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(value.capitalized)
                .fontWeight(.light)
                .foregroundStyle(.primary)
        }
        .padding(.vertical, 4)
    }
}
