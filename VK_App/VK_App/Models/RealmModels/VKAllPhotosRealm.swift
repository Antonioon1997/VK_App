//
//  VKAllPhotosRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 07.08.2021.
//

import Foundation
import UIKit
import RealmSwift

class VKAllPhotosRealm: Object {
    
    @objc dynamic var photosCount: Int = 0
    
    @objc dynamic var ownerID: Int = 0
    @objc dynamic var photoID: Int = 0
    @objc dynamic var albumID: Int = 0
    @objc dynamic var photoDate: Int = 0
    @objc dynamic var hasTags: Bool = false
    
    @objc dynamic var height: Int = 0
    @objc dynamic var width: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    
    @objc dynamic var text: String = ""
    @objc dynamic var userLikes: Int = 0
    @objc dynamic var likesCount: Int = 0
    
    @objc dynamic var repostsCount: Int = 0
    
    override class func primaryKey() -> String? {
        return "photoID"
    }
    
    convenience init(_ photos: AllPhotosItems/*,_ sizes: AllPhotosSizes,_ count: AllPhotosResponse*/) {
        self.init()
        
       /* photosCount = count.count ?? 0 */
        ownerID = photos.ownerID ?? 0
        photoID = photos.id ?? 0
        albumID = photos.albumID ?? 0
        photoDate = photos.date ?? 0
        hasTags = photos.hasTags ?? false
      /*  height = sizes.height ?? 0
        width = sizes.width ?? 0
        url = sizes.url ?? ""
        type = sizes.type ?? ""
        text = photos.text ?? "" */
        userLikes = photos.likes?.userLikes ?? 0
        likesCount = photos.likes?.likesCount ?? 0
        repostsCount = photos.reposts?.count ?? 0
        height = photos.sizes?.last?.height ?? 0
        width = photos.sizes?.last?.width ?? 0
        url = photos.sizes?.last?.url ?? ""
        type = photos.sizes?.last?.type ?? ""
    }
    
    
}
