//
//  OneFileFersponse.swift
//  VK_App
//
//  Created by Антон Онищенко on 26.05.2021.
//

import Foundation

struct OneFileResponse: Decodable {
//    let response: [Items]
//}
//
//struct Items: Codable {
//    let count: Int
//    let friend: [Friend]
//}
//
//struct Friend: Codable {
//    let name: String
//    let surname: String
//    let id: Int
//    let photo: String
//}
//extension OneFileResponse {
//    enum CodingKeys: String, CodingKey {
//        case responce
//
//        enum CodingKeys: String, CodingKey {
//            case count = "count"
//            case items
//            enum CodingKeys: String, CodingKey {
//                case name = "first_name"
//                case surname = "last_name"
//                case id = "id"
//                case photo = "photo_200_orig"
//            }
//        }
//    }
//    required init(from decoder: Decoder) throws {
//        try self.init(from: decoder)
//    }
    
    
    var count: Int
    var name: String
    var surname: String
    var id: Int
    var photo: String
}

extension OneFileResponse {
    enum CodingKeys: String, CodingKey {
        case response
    }
    enum Responce: String, CodingKey {
        case count = "count"
        case items
    }
    enum Items: String, CodingKey {
        case name = "first_name"
        case surname = "last_name"
        case id = "id"
        case photo = "photo_200_orig"
    }
    
    init(from decoder: Decoder) throws {
        try! self.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let responce = try container.nestedContainer(keyedBy: Responce.self, forKey: .response)
        self.count = try responce.decode(Int.self, forKey: .count)
        let items = try responce.nestedContainer(keyedBy: Items.self, forKey: .items)
        self.name = try items.decode(String.self, forKey: .name)
        self.surname = try items.decode(String.self, forKey: .surname)
        self.id = try items.decode(Int.self, forKey: .id)
        self.photo = try items.decode(String.self, forKey: .photo)
    }
    
}
