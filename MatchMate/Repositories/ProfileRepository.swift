//
//  ProfileRepository.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 03/06/26.
//

import Foundation
import CoreData

final class ProfileRepository {
    
    // MARK: - Fetch From API
    
    func fetchProfilesFromAPI() async throws -> [Profile] {
        
        try await APIService.shared.fetchProfiles()
    }
    
    // MARK: - Save Profiles
    
    func saveProfiles(
        _ apiProfiles: [Profile]
    ) {
        
        let context =
        CoreDataManager.shared.context
        
        apiProfiles.forEach { profile in
            
            let entity =
            ProfileEntity(context: context)
            
            entity.id = Int64(profile.id)
            entity.name = profile.name
            entity.phone = profile.phone
            entity.status =
            profile.status ?? "pending"
            entity.imageURL = profile.imageURL
        }
        
        CoreDataManager.shared.saveContext()
    }
    
    // MARK: - Fetch From DB
    
    func fetchProfilesFromDB() throws -> [ProfileEntity] {
        
        let request =
        ProfileEntity.fetchRequest()
        
        return try
        CoreDataManager.shared
            .context
            .fetch(request)
    }
    
    // MARK: - Update Status
    
    func updateStatus(
        for profile: ProfileEntity,
        status: String
    ) {
        
        profile.status = status
        
        CoreDataManager.shared.saveContext()
    }
}
