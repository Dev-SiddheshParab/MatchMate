//
//  ProfileListRow.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 03/06/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileListRow: View {
    let onAccept: () -> Void
    let onDecline: () -> Void

    let profile: ProfileEntity
    var body: some View {
        
        ZStack(alignment: .bottom){
            WebImage(
                url: URL(string: profile.imageURL ?? "")
            )
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .frame(width: UIScreen.main.bounds.width - 40)
            .frame(height: UIScreen.main.bounds.height * 0.5)
            
            LinearGradient(colors: [.clear,.black], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading) {
                Text("\(profile.name ?? ""), 32")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                Text("4ft 10in • Navi Mumbai")
                    .font(.default)
                    .foregroundStyle(.white.opacity(0.95))
            
                
                
                if profile.status != "accepted"{
                    Button {
                        
                        // Decline Action
                        onAccept()
                        
                    } label: {
                        
                        Text("Connect Now")
                            .font(.default)
                            .foregroundStyle(.accent)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.accent, lineWidth: 1.5)
                            )
                    }
                }else if profile.status == "declined"{
                    Button {
                        
                        // Decline Action
                        onAccept()
                    } label: {
                        
                        Text("Changed Your Mind? Accept Now")
                            .font(.default)
                            .foregroundStyle(.green)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.green, lineWidth: 1.5)
                            )
                    }
                }else{
                    HStack(spacing: 16) {
                        
                        Button {
                            
                            // Decline Action
                            onDecline()
                        } label: {
                            
                            Text(AppStrings.decline)
                                .font(.default)
                                .foregroundStyle(.gray)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1.5)
                                )
                        }
                        
                        Button {
                            
                            // Accept Action
                            onAccept()
                        } label: {
                            
                            Text(AppStrings.accept)
                                .font(.default)
                                .foregroundStyle(.green)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.green, lineWidth: 1.5)
                                )
                        }
                    }
                }
            }
            .padding()
        
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(
                    LinearGradient(
                        colors: [
                            .black,
                            .black
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                )
        }
        .padding()
       
    }
}

//#Preview {
//    ProfileListRow(onAccept: <#() -> Void#>, onDecline: <#() -> Void#>, profile: <#ProfileEntity#>)
//}
