//
//  ProfileListViewModel.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 02/06/26.
//

import Foundation
import Combine
import Alamofire
import Observation



import SwiftUI
import CoreData

@Observable
final class ProfileListViewModel {
    
    // MARK: - Properties
    
    private let repository =
    ProfileRepository()
    
    var profiles: [ProfileEntity] = []
    
    var isLoading = false
    
    var errorMessage: String?
    
    var isAPICalled = false
    
    var selectedFilter:
    ProfileFilter = .all
    
    // MARK: - Filtered Profiles
    
    var filteredProfiles: [ProfileEntity] {
        
        switch selectedFilter {
            
        case .all:
            
            return profiles.filter {
                $0.status == "pending"
            }
            
        case .accepted:
            
            return profiles.filter {
                $0.status == "accepted"
            }
            
        case .declined:
            
            return profiles.filter {
                $0.status == "declined"
            }
        }
    }
    
    // MARK: - Fetch Profiles
    
    func fetchProfiles() async {
        
        guard isAPICalled == false else {
            return
        }
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            
            let apiProfiles =
            try await repository
                .fetchProfilesFromAPI()
            
            repository
                .saveProfiles(apiProfiles)
            
            try fetchProfilesFromDB()
            
            isAPICalled = true
            
        } catch {
            
            do {
                
                try fetchProfilesFromDB()
                
            } catch {
                
                errorMessage =
                error.localizedDescription
            }
        }
    }
    
    // MARK: - Fetch From DB
    
    func fetchProfilesFromDB() throws {
        
        let fetchedProfiles =
          try repository
              .fetchProfilesFromDB()
          
          profiles = []
          
          profiles = fetchedProfiles
    }
    
    // MARK: - Accept
    
    func acceptProfile(
        _ profile: ProfileEntity
    ) {
        
        repository.updateStatus(
            for: profile,
            status: "accepted"
        )
        
        try? fetchProfilesFromDB()
    }
    
    // MARK: - Decline
    
    func declineProfile(
        _ profile: ProfileEntity
    ) {
        
        repository.updateStatus(
            for: profile,
            status: "declined"
        )
        
        try? fetchProfilesFromDB()
    }
}
