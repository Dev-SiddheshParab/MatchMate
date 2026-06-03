//
//  APIService.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 03/06/26.
//

import Foundation

final class APIService {

    static let shared = APIService()

    private init() {}

    func fetchProfiles() async throws -> [Profile] {

        guard let url =
                URL(string: APIConstants.baseURL + Endpoint.profiles)
        else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let profiles =
        try JSONDecoder().decode([Profile].self, from: data)

        return profiles
    }
}
