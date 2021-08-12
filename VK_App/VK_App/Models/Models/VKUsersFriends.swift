//
//  VKUsersFriends.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.07.2021.
//

import Foundation
import UIKit

struct VKUsersFriends: Decodable {
    let response: VKUsersFriendsResponse
}

struct VKUsersFriendsResponse: Decodable {
    let items: [VKUsersFriendsItems]
    let count: Int
}

struct VKUsersFriendsItems: Decodable {
    let firstName, lastName, domain, photo50, photo100, photo200Orig, status: String?
    let id, sex, online: Int?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200Orig = "photo_200_Orig"
        case domain, status, id, sex, online
        
    }
}
