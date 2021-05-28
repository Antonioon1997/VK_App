//
//  VKGroupsResponse.swift
//  VK_App
//
//  Created by Антон Онищенко on 27.05.2021.
//

import Foundation

struct VKResponse<VKItems<VKGroups>>.self: Codable {
    let response: VKGroupsItems
    
}
