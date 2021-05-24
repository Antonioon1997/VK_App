//
//  UserSessionInfo.swift
//  VK_App
//
//  Created by Антон Онищенко on 20.05.2021.
//

import UIKit

class UserSessionInfo {
    
    static let instance = UserSessionInfo()
    var userToken: String = ""
    var userID: Int = 0
    
    private init () {}
}

