//
//  VKFriends.swift
//  VK_App
//
//  Created by Антон Онищенко on 24.05.2021.
//

struct VKItems <T: Codable>: Codable {
    
    let count: Int
    let items: [T]
}

extension VKItems {
    
    enum CodingKeys: String, CodingKey {
        
        case count
        case items
    }
}
