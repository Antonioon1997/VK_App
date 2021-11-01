//
//  VKUserProfileRealm.swift
//  VK_App
//
//  Created by Антон Онищенко on 03.08.2021.
//

import Foundation
import RealmSwift

class VKUserProfileRealm: Object {
    
//    @objc dynamic var firstName: String = ""
//    @objc dynamic var lastName: String = ""
//    @objc dynamic var avatarURL: String = ""
//    @objc dynamic var id: Int = 0
//    @objc dynamic var isOnline: Int = 0
    
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var nickname: String? = ""
    @objc dynamic var domain: String? = ""
    @objc dynamic var screenName: String? = ""
    @objc dynamic var status: String? = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var birthdayDate: String? = ""
    @objc dynamic var isOnline: Int = 0

    @objc dynamic var photo50: String? = ""
    @objc dynamic var photo100: String? = ""
    @objc dynamic var photo200: String? = ""
    @objc dynamic var photoMax: String? = ""
    @objc dynamic var photo200Orig: String? = ""
    @objc dynamic var photo400Orig: String? = ""
    
    @objc dynamic var canAccessClosed: Bool = false
    @objc dynamic var isClosed: Bool = false
    @objc dynamic var sex: Int = 0
    @objc dynamic var hasPhoto: Int = 0
    @objc dynamic var hasMobile: Int = 0
    
    @objc dynamic var isFriend: Int = 0
    @objc dynamic var canPost: Int = 0
    @objc dynamic var canSeeAllPosts: Int = 0
    @objc dynamic var canSeeAudio: Int = 0
    @objc dynamic var interests: String? = ""
    @objc dynamic var books: String? = ""
    @objc dynamic var tv: String? = ""
    @objc dynamic var quotes: String? = ""
    @objc dynamic var about: String? = ""
    @objc dynamic var games: String? = ""
    @objc dynamic var movies: String? = ""
    @objc dynamic var activities: String? = ""
    @objc dynamic var music: String? = ""
    
    @objc dynamic var canWritePrivateMessage: Int = 0
    @objc dynamic var canSendFriendRequest: Int = 0
    @objc dynamic var canBeInviteGroup: Bool = false
    @objc dynamic var mobilePhone: String? = ""
    @objc dynamic var homePhone: String? = ""
    @objc dynamic var site: String? = ""
    
//    let lastSeen: LastSeen?
    
    @objc dynamic var followersCount: Int = 0
    @objc dynamic var blacklisted: Int = 0
    @objc dynamic var blacklistedByMe: Int = 0
    @objc dynamic var isFavorite: Int = 0
    @objc dynamic var isHidenFromFeed: Int = 0
    
    @objc dynamic var platform: Int = 0
    @objc dynamic var lastSeen: Int = 0
    
    @objc dynamic var occupationID: Int = 0
    @objc dynamic var occupationName: String? = ""
    @objc dynamic var occupationType: String? = ""
    
    @objc dynamic var cityID: Int = 0
    @objc dynamic var cityTitle: String? = ""
//    let occupation: Occupation?
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
extension VKUserProfileRealm {
    
    convenience init (_ user: VKUser){
        self.init()
        firstName = user.firstName
        lastName = user.lastName
        nickname = user.nickname
        domain = user.domain
        screenName = user.screenName
        status = user.status
        id = user.id
        birthdayDate = user.birthdayDate
        isOnline = user.isOnline
        photo50 = user.photo50
        photo100 = user.photo100
        photo200 = user.photo200
        photoMax = user.photoMax
        photo200Orig = user.photo200Orig
        photo400Orig = user.photo400Orig
        canAccessClosed = user.canAccessClosed ?? false
        isClosed = user.isClosed ?? false
        sex = user.sex ?? 0
        hasPhoto = user.hasPhoto ?? 0
        hasMobile = user.hasMobile ?? 0
        isFriend = user.isFriend ?? 0
        canPost = user.canPost ?? 0
        canSeeAllPosts = user.canSeeAllPosts ?? 0
        canSeeAudio = user.canSeeAudio ?? 0
        interests = user.interests
        books = user.books
        tv = user.tv
        quotes = user.quotes
        about = user.about
        games = user.games
        movies = user.movies
        activities = user.activities
        music = user.music
        canWritePrivateMessage = user.canWritePrivateMessage ?? 0
        canSendFriendRequest = user.canSendFriendRequest ?? 0
        canBeInviteGroup = user.canBeInviteGroup ?? false
        mobilePhone = user.mobilePhone
        homePhone = user.homePhone
        site = user.site
        followersCount = user.followersCount ?? 0
        blacklisted = user.blacklisted ?? 0
        blacklistedByMe = user.blacklistedByMe ?? 0
        isFavorite = user.isFavorite ?? 0
        isHidenFromFeed = user.isHidenFromFeed ?? 0
        lastSeen = user.lastSeen?.time ?? 0
        platform = user.lastSeen?.platform ?? 0
        occupationID = user.occupation?.occupationId ?? 0
        occupationName = user.occupation?.occupationName ?? ""
        occupationType = user.occupation?.occupationType ?? ""
        cityID = user.city?.id ?? 0
        cityTitle = user.city?.title ?? ""
        
    }
//    convenience init (_ time: LastSeen) {
//        self.init()
//        platform = time.platform
//        lastSeen = time.time
//
//    }
}
