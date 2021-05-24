//
//  FriendsData.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import Foundation
import UIKit

struct FriendsData {
    let name: String
    let city: String
    let avatar: UIImage
    let friendPhotos: [UIImage?]
    let id: String
}

struct SortedFriends {
    let friends: [FriendsData]
    let firstLetters: String
}
