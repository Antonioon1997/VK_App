//
//  VKAllPhotos.swift
//  VK_App
//
//  Created by Антон Онищенко on 03.08.2021.
//

import Foundation

struct AllPhotos: Decodable {
    
    let response: AllPhotosResponse
    
    enum CodingKeys: String, CodingKey{
        case response = "response"
    }
}

struct AllPhotosResponse: Decodable {
    
    let count: Int
    let items: [AllPhotosItems]
    
    enum CodingKeys: String, CodingKey{
        case count = "count"
        case items = "items"
    }
}

struct AllPhotosItems: Decodable {
    
    let albumID, date, id, ownerID, realOffset: Int?
    let hasTags: Bool?
    let text: String?
    let likes: AllPhotosLikes?
    let reposts: AllPhotosReposts?
    
    let sizes: [AllPhotosSizes]?
    
    enum CodingKeys: String, CodingKey {
        
        case date, id, text, sizes
        case albumID = "album_id"
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case realOffset = "real_offset"
        case likes, reposts
    }
}

struct AllPhotosSizes: Decodable {
    let height, width: Int?
    let url, type: String?
}

struct AllPhotosLikes: Decodable {
    
    let userLikes: Int?
    let likesCount: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case userLikes = "user_likes"
        case likesCount = "count"
    }
}

struct AllPhotosReposts: Decodable {
    
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case count
    }
}
