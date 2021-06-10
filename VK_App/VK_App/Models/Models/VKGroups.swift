//
//  VKGroups.swift
//  VK_App
//
//  Created by Антон Онищенко on 26.05.2021.
//

import Foundation


struct VKGroups: Codable {
    
    let id: Int
    let name: String
    let avatar: String
}
extension VKGroups {
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case avatar = "photo_200"
    }
}
