//
//  VKPhotosRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.06.2021.
//

import Foundation
import RealmSwift


class VKPhotosRealm: Object {
    
    @objc dynamic var photoID: Int = 0
    @objc dynamic var postID: Int = 0
    @objc dynamic var photoSize75: String = ""
    @objc dynamic var photoSize130: String = ""
    @objc dynamic var photoSize604: String = ""
    @objc dynamic var photoSize807: String? = ""
    @objc dynamic var photoSize1280: String? = ""
    @objc dynamic var photoSize2560: String? = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
