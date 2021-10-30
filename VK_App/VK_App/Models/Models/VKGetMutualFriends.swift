//
//  VKGetMutualFriends.swift
//  VK_App
//
//  Created by Антон Онищенко on 01.08.2021.
//

import Foundation

struct GetMutualFriends: Decodable {
    let response: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
}
