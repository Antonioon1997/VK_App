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
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKResponse<VKItems<VKUser>>.self) { response in
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
        
        AF.request(url, method: .get, parameters: parameters).responseDecodable(of: VKResponse<VKItems<VKUser>>.self) { response in
            switch response.result {
            case .success(let vkResponce):
                completion( vkResponce.response.items.map({VKUserRealm($0)}))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
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
}

