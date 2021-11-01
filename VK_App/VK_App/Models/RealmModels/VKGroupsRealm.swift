//
//  VKGroupsRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 02.06.2021.
//

import Foundation
import RealmSwift

class VKGroupsRealm: Object {

    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var avatar: String = ""
    @objc dynamic var isMember: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}

extension VKGroupsRealm {
    
    convenience init(_ groups: VKGroups){
        self.init()
        id = groups.id
        name = groups.name
        avatar = groups.avatar
        isMember = groups.isMember
    }
}
