//
//  VKFriends.swift
//  VK_App
//
//  Created by Антон Онищенко on 26.05.2021.
//

import Foundation

struct VKFriends: Codable {
    
    let firtsName: String
    let lastName: String
    let id: Int
    let avatarPhoto: String
}

//extension VKFriends {
//    enum Response: String, CodingKey {
//        case response = JSONContainer
//    }
//    enum CodingKeys: String, CodingKey {
//        case firtsName = "frist_name";
//        case lastName = "last_name";
//        case id = "id";
//        case avatarPhoto = "photo_200_orig"
//    
//    }
//}
