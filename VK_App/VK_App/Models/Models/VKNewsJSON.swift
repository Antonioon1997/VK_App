//
//  VKNewsJSON.swift
//  VK_App
//
//  Created by Антон Онищенко on 25.06.2021.
//

import Foundation
import SwiftyJSON

struct VKNewsJSON {
    let sourceID: Int
    let date: Double
    let canDoubtCategory: Bool
    let canSetCategory: Bool
    let posType: String
    let text: String
//    let comments: [Comments]
//    let albumID: Int
//    let photo130: String
    
}

extension VKNewsJSON {
    init (_ json: JSON) {
        let sourceID = json["source_id"].intValue
        let date = json["date"].doubleValue
        let canDoubtCategory = json["can_doubt_category"].boolValue
        let canSetCategory = json["can_set_category"].boolValue
        let posType = json["post_type"].stringValue
        let text = json["text"].stringValue
//        let albumID = json["album_id"].intValue
//        let photo130 = json["photo_130"].stringValue
        
        self.init(sourceID: sourceID, date: date, canDoubtCategory: canDoubtCategory, canSetCategory: canSetCategory, posType: posType, text: text)
    }
}


//struct Comments {
//    let count: Int
//    let canPost: Int
//    
//    
//}
//extension Comments {
//    init(_ json: JSON){
//        let count = json["count"].intValue
//        let canPost = json["can_post"].intValue
//        
//        self.init(count:count, canPost: canPost)
//    }
//}



