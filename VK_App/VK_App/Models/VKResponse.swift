//
//  VKResponse.swift
//  VK_App
//
//  Created by Антон Онищенко on 24.05.2021.
//

struct VKResponse <T:Codable>: Codable {
    let response: T
}
