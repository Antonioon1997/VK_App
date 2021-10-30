//
//  VKSearchUserReam.swift
//  VK_App
//
//  Created by Антон Онищенко on 16.06.2021.
//

import Foundation

import Foundation
import RealmSwift

class VKUserUserRealm: Object, Codable {
    
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var avatarURL: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var isOnline: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
