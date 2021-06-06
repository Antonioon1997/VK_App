//
//  VKGroupsItems.swift
//  VK_App
//
//  Created by Антон Онищенко on 27.05.2021.
//

import Foundation

struct VKGroupsItems: Codable {
    
    let count: Int
    let items: [VKGroup]
}
