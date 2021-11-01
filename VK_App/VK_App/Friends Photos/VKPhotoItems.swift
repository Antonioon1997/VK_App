//
//  VKPhotoItems.swift
//  VK_App
//
//  Created by Антон Онищенко on 27.05.2021.
//

import Foundation

struct VKPhotoItems: Codable {
    let count: Int
    let items: [VKPhoto]
}
