//
//  UserSessionInfo.swift
//  VK_App
//
//  Created by Антон Онищенко on 20.05.2021.
//

import UIKit
import Alamofire

class NetworkSession {
    
    static let instance = NetworkSession()
    
    let baseURL = "https://api.vk.com/"
    let accessKey = "i4NDFNOlRdNnij4XT73d"
    let path = "method/"
    var appID: Int = 7861219
    var token: String = ""
    var myID: String = ""
    var method: String = ""
    
    
    func fetchData(methodForSearch: String, parameters: Parameters) {
        
        let url = baseURL+path+methodForSearch

        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            print(response.value ?? " something wrong " )
        }
        
    }
    
    private init () {}

}
