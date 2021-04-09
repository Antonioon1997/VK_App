//
//  NewsFeedData.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.04.2021.
//

import Foundation
import UIKit

struct NewsFeed {
    let authorName: String!
    let authorDescription: String?
    let authorAvatar: UIImage!
    let postText: String?
    let postImages: [UIImage?]
}
