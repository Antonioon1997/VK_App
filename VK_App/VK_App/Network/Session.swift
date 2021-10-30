//
//  UserSessionInfo.swift
//  VK_App
//
//  Created by Антон Онищенко on 20.05.2021.
//

import UIKit
import Alamofire

class Session {
    
    static let instance = Session()
    
    let accessKey = "i4NDFNOlRdNnij4XT73d"
    var appID: Int = 7861219
    let serviceKey = "bba75180bba75180bba7518084bbd0a263bbba7bba75180db0e7d2c264e82fa188f7cbb"
    var token: String = ""
    let appVersion = "5.60"
    var myID: String = ""
    var userID: String = ""
    
    
    
    
    
    private init () {}

}
