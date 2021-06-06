//
//  VKResponseRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 02.06.2021.
//

import Foundation
import RealmSwift

class VKResponseRealm <T:Object>: Object, Codable {
//    @objc dynamic var response: VKItemsRealm?
    var response = List<VKItemsRealm>()
    
}
