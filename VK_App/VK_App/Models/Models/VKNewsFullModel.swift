

struct VKNews: Decodable {
    let response: Response
}

// MARK: - Response
struct Response: Decodable {
    let items: [Item]?
//    let profiles: [Profile?]
    let groups: [Group]?
    let nextFrom: String?

    enum CodingKeys: String, CodingKey {
        case items, /*profiles,*/ groups
        case nextFrom = "next_from"
    }
}

struct Group: Decodable {
    let id, isClosed: Int
    let name, screenName, type, photo50, photo100, photo200: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name, type
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

struct Item: Decodable {
    let sourceID, date,  postID: Int?
    let topicID: Int?
    let postType, text: String?
    let attachments: [Attachments]?
    let comments: Comments?
    let likes: Likes?
    let reposts: Reposts?

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case topicID = "topic_id"
        case postType = "post_type"
        case postID = "post_id"
        case text, date, attachments, comments, likes, reposts
    }
}

struct Attachments: Decodable {
    let type: String?
    let photo: Photo?
    let video: Video?
    
    enum CodingKeys: String, CodingKey {
        case type
        case photo
        case video
    }
}

struct Photo: Decodable {
    let albumID, date, id, ownerID, postID: Int?
    let accessKey, text: String?
    let sizes: [Sizes]
    
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case ownerID = "owner_id"
        case postID = "post_id"
        case date, id
        case accessKey = "access_key"
        case text
        case sizes
    }
}

struct Sizes: Decodable {
    
    let height, width: Int?
    let url, type: String?
    
    enum CodingKeys: String, CodingKey {
        
        case height, width
        case url, type
    }
}

struct Video: Decodable {
    
    let accessKey, description: String?
    let canComment, canEdit, canLike, canRepost, canSubscribe, canAddToFaves, canAdd, canAttachLink, comments, date, durations: Int?
    let photo130, photo320, photo800, photo1280, title, trackCode: String?
    let width, height, id, ownerID, views: Int?
    
    enum CodingKeys: String, CodingKey {
        case accessKey = "access_key"
        case canComment = "can_comment"
        case canEdit = "can_edit"
        case canLike = "can_like"
        case canRepost = "can_repost"
        case canSubscribe = "can_subscribe"
        case canAddToFaves = "can_add_to_faves"
        case canAdd = "can_add"
        case canAttachLink = "can_attach_link"
        case comments, description
        case date
        case durations
        case photo130 = "photo_130"
        case photo320 = "photo_320"
        case photo800 = "photo_800"
        case photo1280 = "photo_1280"
        case ownerID = "owner_id"
        case width, height, id , views, title
        case trackCode = "track_code"
        
    }
}



struct Comments: Decodable {
    let count, canPost: Int?
    
    enum CodingKeys: String, CodingKey {
        case count
        case canPost = "can_post"
    }
}

struct Likes: Decodable {
    let count, userLikes, canLike, canPublish: Int?
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
        case canLike = "can_like"
        case canPublish = "can_publish"
    }
}

struct Reposts: Decodable {
    let count, userReposted: Int?
    
    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}
