//
//  VKPhotosRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.06.2021.
//

import Foundation
import RealmSwift

class VKPhotosRealm: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerID: Int = 0
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

extension VKPhotosRealm {
    
    convenience init(_ photos: VKPhoto) {
        self.init()
        
        id = photos.id
        ownerID = photos.ownerID
        postID = photos.postID
        photoSize75 = photos.photoSize75
        photoSize130 = photos.photoSize130
        photoSize604 = photos.photoSize604
        photoSize807 = photos.photoSize807
        photoSize1280 = photos.photoSize1280
        photoSize2560 = photos.photoSize2560
    }
}
