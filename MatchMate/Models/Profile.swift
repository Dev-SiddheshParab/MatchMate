//
//  Profile.swift
//  MatchMate
//
//  Created by Siddhesh Parab on 03/06/26.
//

import Foundation

struct Profile: Codable,Identifiable {
    let id: Int
    var name: String
    let phone: String
    var status:String?
    
    var imageURL: String {
           
           let index =
           id % ProfileImages.urls.count
           
           return ProfileImages.urls[index]
       }
}

enum ProfileImages {
    
    static let urls = [
        
        "https://i.pinimg.com/736x/2c/d1/96/2cd1968319845075369f17703bc95a1a.jpg",
        
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLLHhaCssqSDkEIM3yfS7BNnNMz7RMgpxQpOTp7jqF1rQbewfvDzutyvA&s=10",
        
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7I918YCH-5qESSClQeRCQhle-j1xsBYUKu_IbVCqLZg&s=10",
        
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG_M4D8LsDk9iIPAZB9T21i2K4E7PQGJVdwfvhILobBFBanDn698N8e3A&s=10",
        
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9q4i7-3KjN6g4SGLqdqPd3311EyO-y3WtrGGl2MWLLpFP90M-Onmcobk&s=10",
        
        "https://images.bewakoof.com/utter/content/3427/content_green.jpg",
        
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaSgT-XNI6017tDQ7k4Qr8tTQPTzUb4TvAY9G2wDybWXE49Sz2Daxt9V1z&s=10",
        
        "https://www.mysoresareeudyog.com/media/wysiwyg/piku-image-7-girl-next-door.jpg",
        
        "https://i.pinimg.com/736x/11/ac/88/11ac88c37415388cc84c415869efd9e2.jpg",
        
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsO_SBnNICqYujjXEctcPs-9FTvR6QE-iGdYa2speMXQ&s=10"
        
    ]
}
