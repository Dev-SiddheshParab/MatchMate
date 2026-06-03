//
//  APIConstants.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 03/06/26.
//

import Foundation

enum APIConstants {
    static let baseURL = "https://jsonplaceholder.typicode.com"
}


enum Endpoint {
    static let profiles = "/users"
}

protocol APIServiceProtocol {

    func fetchProfiles() async throws -> [Profile]
}
