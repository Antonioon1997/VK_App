//
//  VKGroupsRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 02.06.2021.
//

import Foundation
import RealmSwift

class VKGroupsRealm: Object {

    @objc dynamic var groupId: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var avatar: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
