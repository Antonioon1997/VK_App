//
//  VKItemsRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 02.06.2021.
//

import Foundation
import RealmSwift

class VKItemsRealm <T: Object>: Object, Codable {
    @objc dynamic var count: Int = 0
    let items = List<T>()
}
extension VKItemsRealm {
    enum CodingKeys: String, CodingKey {
        case count = "count"
    }
}
