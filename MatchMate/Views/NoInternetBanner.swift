//
//  NoInternetBanner.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 03/06/26.
//

import SwiftUI

struct NoInternetBanner: View {
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            Image(systemName: "wifi.slash")
            
            Text(AppStrings.noInternetConnection)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .background(
            Capsule()
                .fill(.red)
        )
        .shadow(radius: 6)
        .padding(.bottom, 24)
    }
}

#Preview {
    NoInternetBanner()
}
