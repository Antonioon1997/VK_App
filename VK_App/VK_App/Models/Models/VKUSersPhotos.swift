//
//  VKUSersPhotos.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.07.2021.
//

import Foundation
import UIKit

struct VKUsersPhotos: Decodable {
    let response : VKUsersPhotosResponse?
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
}

struct VKUsersPhotosResponse: Decodable {
    let items: [VKUsersPhotosItems]?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
        case count = "count"
    }
}

struct VKUsersPhotosItems: Decodable {
    let albumID, date, id, ownerID, height, width, postID: Int?
    let photo75, photo130, photo604, photo807, photo1280,photo2560, text: String?
    
    
    enum CodingKeys: String, CodingKey {
    
    case albumID = "album_id"
    case ownerID = "owner_id"
    case photo1280 = "photo_1280"
    case photo130 = "photo_130"
    case photo2560 = "photo_2560"
    case photo604 = "photo_604"
    case photo75 = "photo_75"
    case photo807 = "photo_807"
    case postID = "post_id"
    case height, date, id, text,width
    }
}
