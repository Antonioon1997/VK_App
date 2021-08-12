//
//  NetworkRequests.swift
//  VK_App
//
//  Created by Антон Онищенко on 24.05.2021.
//

import Foundation
import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON
import Kingfisher

class NetworkService{
    let baseURL = "https://api.vk.com/"
    let path = "method/"
    var id: String = ""
    var order: String = ""

    func getFriends(_ user_id: String,_ order: String,_ offset: String,_ fields: String,  completion: @escaping ([VKUserRealm]?) -> Void ) {
        
        let url = baseURL+path+"friends.get"
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : Session.instance.appVersion,
            "user_id" : user_id,
            "order" : order,
            "offset" : offset,
            "fields" : fields
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKResponse<VKItems<VKFriend>>.self) { response in
            switch response.result {
            case .success(let vkResponce):
                completion( vkResponce.response.items.map({VKUserRealm($0)}))
            case .failure(let error):
                print(error)
            }
        }
    }
    func searchFriends(_ user_id: String,_ offset: String,_ fields: String,_ searchText: String,  completion: @escaping ([VKUserRealm]?) -> Void ) {
        
        let url = baseURL+path+"friends.get"
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : Session.instance.appVersion,
            "user_id" : user_id,
            "q" : searchText,
            "offset" : offset,
            "fields" : fields
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKResponse<VKItems<VKFriend>>.self) { response in
            switch response.result {
            case .success(let vkResponce):
                completion( vkResponce.response.items.map({VKUserRealm($0)}))
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func searchUsersFriends(_ user_id: String,_ offset: String,_ fields: String,_ searchText: String,  completion: @escaping ([VKFriends]?) -> Void ) {
//        
//        let url = baseURL+path+"friends.get"
//        let parameters: Parameters = [
//            "access_token" : Session.instance.token,
//            "v" : Session.instance.appVersion,
//            "order" : "hints",
//            "count" : "",
//            "name_case" : "",
//            "user_id" : user_id,
//            "q" : searchText,
//            "offset" : offset,
//            "fields" : fields
//        ]
//        
//        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKFriendsSearch.self) { response in
//            switch response.result {
//            case .success(let vkResponce):
//                completion( vkResponce.response.items )
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    
    func getGroups(_ user_id: String,_ extended: String,_ filter: String,_ fields: String,_ offset: String,_ count: String, completion: @escaping ([VKGroupsRealm]?) -> Void )  {
         
        let url = baseURL+path+"groups.get"
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : Session.instance.appVersion,
            "user_id" : user_id,
            "extended" : extended,
            "filter" : filter,
            "fields" : fields,
            "offset" : offset,
            "count" : count
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKResponse<VKItems<VKGroups>>.self) { response in
            switch response.result {
            case .success(let vkResponce):
//                print(vkResponce)
                completion(vkResponce.response.items.map{VKGroupsRealm($0)})

            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getPhotos(_ owner_id: String,_ album_id: String,_ photo_ids: String,_ rev: String,_ extended: String,_ feed_type: String,_ feed: String,_ photo_sizes: String,_ offset: String,_ count: String,  completion: @escaping ([VKPhotosRealm]?) -> Void ) {
        let url = baseURL+path+"photos.get"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : Session.instance.appVersion,
            "owner_id" : owner_id,
            "album_id" : album_id,
            "photo_ids" : photo_ids,
            "rev" : rev,
            "extended" : extended,
            "feed_type" : feed_type,
            "feed" : feed,
            "photo_sizes" : photo_sizes,
            "offset" : offset,
            "count" : count
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKResponse<VKItems<VKPhoto>>.self) { response in
            switch response.result {
            case .success(let vkResponce):
                print(vkResponce)
                completion(vkResponce.response.items.map({VKPhotosRealm($0)}))

            case .failure(let error):
                print(error)

            }
        }
    }
    
    
    
    func getNews (completion: @escaping (Response?) -> Void) {
        
        let url = baseURL+path+"newsfeed.get"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : Session.instance.appVersion,
            "filter" : "post",
            "return_banned" : "0",
            "max_photos" : "9",
            "source_ids" : "groups",
            "count" : "100"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(let vkResponce):
                completion(vkResponce.response)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUser (_ userID: Int, completion: @escaping (VKUserResponse) -> Void) {
        let url = baseURL + path + "users.get"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : "6.62",
            "user_ids" : userID,
            "fields" : "photo_id, verified, sex, bdate, has_photo, photo_50, photo_100, photo_200_orig, online, domain, has_mobile, music, movies, tv, books, games, about, quotes, can_post, can_see_all_posts, last_seen, followers_count, occupation",
            "name_case" : "nom"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKUserResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUserRealm (_ userID: Int, completion: @escaping ([VKUserProfileRealm]) -> Void) {
        let url = baseURL + path + "users.get"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : "6.62",
            "user_ids" : userID,
            "fields" : "photo_id, verified, sex, bdate, has_photo, photo_50, photo_100, photo_200_orig, online, domain, has_mobile, music, movies, tv, books, games, about, quotes, can_post, can_see_all_posts, last_seen, followers_count, occupation, status, site, city",
            "name_case" : "nom"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKUserResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(result.response.map({VKUserProfileRealm($0)}))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getUsersFriends(_ userID: Int,_ order: String,_ listID: String,_ count: String,_ fields: String,_ nameCase: String,_ ref: String, completion: @escaping ([VKUsersFriendsItems]) ->Void) {
    
        let url = baseURL + path + "friends.get"
        
        let paramaters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : "5.131",
            "user_id" : userID,
            "order" : order,
            "list_id" : listID,
            "count" : count,
            "fields" : fields,
            "name_case" : nameCase,
            "ref" : ref
        ]
        
        AF.request(url, method: .get, parameters: paramaters).responseDecodable(of: VKUsersFriends.self) { response in
            switch response.result {
            case .success(let response):
                print(response)
                completion(response.response.items)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUsersPhotos(_ owner_id: Int,_ album_id: String,_ photo_ids: String,_ rev: String,_ extended: String,_ feed_type: String,_ feed: String,_ photo_sizes: String,_ offset: String,_ count: String,  completion: @escaping ([VKUsersPhotosItems]?) -> Void ) {
        let url = baseURL+path+"photos.get"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : "5.60",
            "owner_id" : owner_id,
            "album_id" : album_id,
            "photo_ids" : photo_ids,
            "rev" : rev,
            "extended" : extended,
            "feed_type" : feed_type,
            "feed" : feed,
            "photo_sizes" : photo_sizes,
            "offset" : offset,
            "count" : count
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKUsersPhotos.self) { response in
            switch response.result {
            case .success(let response):
                completion(response.response?.items)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getMutualFriends(_ sourceUid : String,_ targetUid: Int,_ targetUidS: String,_ order : String,_ count: Int,_ offset: String, completion: @escaping (GetMutualFriends) -> Void ){
        let url = baseURL + path + "friends.getMutual"
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : "5.131",
            "source_uid" : sourceUid,
            "target_uid" : targetUid,
            "target_uids" : targetUidS,
            "order" : order,
            "count" : count,
            "offset" : offset
        ]
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: GetMutualFriends.self) { response in
            switch response.result {
            case .success(let response):
                completion(response)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func getAllPhotos(_ ownerID: Int,_ extended: String,_ offset: String,_ count: String,_ photoSizes: String,_ noServiseAlbums: String,_ needHiden: String,_ skipHidden: String, completion: @escaping (AllPhotosItems) -> Void) {
        
        let url = baseURL + path + "photos.getAll"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : "5.131",
            "owner_id" : 13952115,
            "extended" : extended,
            "offset" : offset,
            "count" : count,
            "photo_sizes" : photoSizes,
            "no_service_albums" : noServiseAlbums,
            "need_hidden" : needHiden,
            "skip_hidden" : skipHidden
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: AllPhotos.self) { response in
            switch response.result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getAllPhotosRealm(_ ownerID: Int,_ offset: String,_ photoSizes: String,_ noServiseAlbums: String,_ needHiden: String,_ skipHidden: String, completion: @escaping ([VKAllPhotosRealm]) -> Void) {
        
        let url = baseURL + path + "photos.getAll"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : "5.131",
            "owner_id" : ownerID,
            "extended" : 1,
            "offset" : offset,
            "count" : 200,
            "photo_sizes" : photoSizes,
            "no_service_albums" : noServiseAlbums,
            "need_hidden" : needHiden,
            "skip_hidden" : skipHidden
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: AllPhotos.self) { response in
            switch response.result {
            case .success(let response):
                completion(response.response.items.map({VKAllPhotosRealm($0)}))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPermission() {
        let url = baseURL + path + "account.getAppPermissions"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : "5.131",
            "user_id" : Session.instance.myID
        ]
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: GetAppPremission.self) { response in
            switch response.result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func getWall (_ ownerID: Int, completion: @escaping (Response?) -> Void) {
        
        let url = baseURL+path+"wall.get"
        
        let parameters: Parameters = [
            "access_token" : Session.instance.token,
            "v" : Session.instance.appVersion,
            "owner_id" : ownerID,
            "domain" : "",
            "offset" : "",
            "extended" : "0",
            "filter" : "all",
            "count" : "100"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(let vkResponce):
                completion(vkResponce.response)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func getComments( completion: )

}
