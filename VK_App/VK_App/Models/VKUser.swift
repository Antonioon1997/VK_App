//
//  FriendsData.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import Foundation
import UIKit

struct VKUser {
    
    let firstName: String
    let lastName: String
    let avatarURL: String
    let userID: Int
}

extension VKUser: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarURL = "photo_200_orig"
        case userID = "id"
    }
}


