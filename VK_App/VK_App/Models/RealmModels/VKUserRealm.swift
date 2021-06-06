//
//  VKUserRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 02.06.2021.
//

import Foundation
import RealmSwift

class VKUserRealm: Object, Codable {
    
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var avatarURL: String = ""
    @objc dynamic var userID: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
