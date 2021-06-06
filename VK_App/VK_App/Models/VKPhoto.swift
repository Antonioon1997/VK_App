//
//  VKPhoto.swift
//  VK_App
//
//  Created by Антон Онищенко on 27.05.2021.
//

import Foundation

struct VKPhoto: Codable {
    
    let photoID: Int
    let postID: Int
    let photoSize75: String
    let photoSize130: String
    let photoSize604: String
    let photoSize807: String?
    let photoSize1280: String?
    let photoSize2560: String?
}

extension VKPhoto {
    
    enum CodingKeys: String, CodingKey {
        
        case photoID = "id"
        case postID = "post_id"
        case photoSize75 = "photo_75"
        case photoSize130 = "photo_130"
        case photoSize604 = "photo_604"
        case photoSize807 = "photo_807"
        case photoSize1280 = "photo_1280"
        case photoSize2560 = "photo_2560"
    }
}
