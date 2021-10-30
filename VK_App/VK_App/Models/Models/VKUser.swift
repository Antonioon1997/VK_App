//
//  VKUser.swift
//  VK_App
//
//  Created by Антон Онищенко on 30.07.2021.
//

import Foundation
import UIKit

struct VKUserResponse: Decodable {
    let response: [VKUser]
    
    enum CodingKeys: String, CodingKey{
        case response
    }
    
}

struct VKUser : Decodable {
    
    let firstName: String
    let lastName: String
    let nickname: String?
    let domain: String?
    let screenName: String?
    let status: String?
    let id: Int
    let birthdayDate: String?
    let isOnline: Int

    let photo50: String?
    let photo100: String?
    let photo200: String?
    let photoMax: String?
    let photo200Orig: String?
    let photo400Orig: String?
    
    let canAccessClosed: Bool?
    let isClosed: Bool?
    let sex: Int?
    let hasPhoto: Int?
    let hasMobile: Int?
    
    let isFriend: Int?
    let canPost: Int?
    let canSeeAllPosts: Int?
    let canSeeAudio: Int?
    let interests: String?
    let books: String?
    let tv: String?
    let quotes: String?
    let about: String?
    let games: String?
    let movies: String?
    let activities: String?
    let music: String?
    
    let canWritePrivateMessage: Int?
    let canSendFriendRequest: Int?
    let canBeInviteGroup: Bool?
    let mobilePhone: String?
    let homePhone: String?
    let site: String?
    
    let lastSeen: LastSeen?
    
    let followersCount: Int?
    let blacklisted: Int?
    let blacklistedByMe: Int?
    let isFavorite: Int?
    let isHidenFromFeed: Int?
    
    let occupation: Occupation?
    
    let city: City?
    
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case screenName = "screen_name"
        case birthdayDate = "bdate"
        case isOnline = "online"
        
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
        case photoMax = "photo_max"
        case photo200Orig = "photo_200_orig"
        case photo400Orig = "photo_400_orig"
        
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case hasPhoto = "has_photo"
        case hasMobile = "has_mobile"
        
        case isFriend = "is_friend"
        case canPost = "can_post"
        case canSeeAllPosts = "can_see_all_posts"
        case canSeeAudio = "can_see_audio"
        
        case canWritePrivateMessage = "can_write_private_message"
        case canSendFriendRequest = "can_send_friend_request"
        case canBeInviteGroup = "can_be_invited_group"
        case mobilePhone = "mobile_phone"
        case homePhone = "home_phone"
        
        case followersCount = "followers_count"
        case blacklistedByMe = "blacklisted_by_me"
        case isFavorite = "is_favorite"
        case isHidenFromFeed = "is_hidden_from_feed"
        
        case nickname, domain, status, id, sex, interests, books, tv, quotes, about, games, movies, activities, music, site, city

        case lastSeen = "last_seen"
        case blacklisted
        case occupation
        
    }
    
}

struct City: Decodable {
    
    let id: Int?
    let title: String?
    
    enum CodingKeys: String, CodingKey{
        case id, title
    }
}

struct LastSeen: Decodable {
    
    let platform: Int
    let time: Int
    
    enum CodingKeys: String, CodingKey {
        case platform
        case time
    }
}

struct Occupation: Decodable {
    
    let occupationId: Int?
    let occupationName: String?
    let occupationType: String?
    
    enum CodingKeys: String, CodingKey {
        case occupationId = "id"
        case occupationName = "name"
        case occupationType = "type"
    }
}

