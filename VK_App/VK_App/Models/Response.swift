//
//  Response.swift
//  VK_App
//
//  Created by Антон Онищенко on 26.05.2021.
//

import Foundation

struct Response: Codable {
    
    let response: JSONContainer
}

extension Response {
    enum Response: String, CodingKey {
        case response
        
        enum JSONContainer: String, CodingKey {
            case count = "count"
            case vkFriends
            
            enum CodingKeys: String, CodingKey {
                case firtsName = "frist_name";
                case lastName = "last_name";
                case id = "id";
                case avatarPhoto = "photo_200_orig"
            
            }
            
        
    }
//
//    enum CodingKeys: String, CodingKey {
//        case firtsName = "frist_name";
//        case lastName = "last_name";
//        case id = "id";
//        case avatarPhoto = "photo_200_orig"
//
    }
}
