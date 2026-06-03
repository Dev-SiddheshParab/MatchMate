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
            "https://cdn.i-scmp.com/sites/default/files/styles/1020x680/public/d8/images/methode/2021/09/28/8ee428ac-2031-11ec-83d0-b8338c7f9150_image_hires_174143.JPG?itok=FgbcVc_E&v=1632822111"
        }
}
