//
//  JSONContainer.swift
//  VK_App
//
//  Created by Антон Онищенко on 26.05.2021.
//

import Foundation

struct JSONContainer: Codable {
    let count: Int
    let vkFriends: [VKFriends]
}
