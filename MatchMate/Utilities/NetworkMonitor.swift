//
//  NetworkMonitor.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 03/06/26.
//

import Foundation
import Network
import Observation

@Observable
final class NetworkMonitor {
    
    static let shared =
    NetworkMonitor()
    
    var isConnected = true
    
    private let monitor =
    NWPathMonitor()
    
    private let queue =
    DispatchQueue(
        label: "NetworkMonitor"
    )
    
    private init() {
        
        monitor.pathUpdateHandler = {
            [weak self] path in
            
            Task { @MainActor in
                self?.isConnected =
                path.status == .satisfied
                print("Connection : \(path.status)")
            }
        }
        
        monitor.start(queue: queue)
    }
}
