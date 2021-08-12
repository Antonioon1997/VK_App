//
//  Colors.swift
//  VK_App
//
//  Created by Антон Онищенко on 01.04.2021.
//

import Foundation
import UIKit

public struct Presets {
    
    let postTimeFormatter = DateFormatter()
    let postDateFormatter = DateFormatter()
    //MARK: - Colors
    let vkBlue = UIColor(red: 82.0/255.0, green: 129.0/255.0, blue: 185.0/255.0, alpha: 1)
    let vkLightBlue = UIColor(red: 95.0/255.0, green: 155.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    let vkDarkGray = UIColor(red: 25.0/255, green: 25.0/255, blue: 27.0/255, alpha: 1)
    let vkGray = UIColor(red: 35.0/255, green: 35.0/255, blue: 36.0/255, alpha: 1)
    let vkLightGray = UIColor(red: 105.0/255, green: 105.0/255, blue: 106.0/255, alpha: 1)
    let vkButtonsBackgroundColor = UIColor(red: 226.0/255, green: 228.0/255, blue: 231.0/255, alpha: 1)
        /*Red: 226
    Green: 228
    Blue: 231
    */
    let placeholderLightGray = UIColor(red: 140.0/255, green: 142.0/255, blue: 146.0/255.0, alpha: 1)
    let onlineViewColor = UIColor(red: 71.0/255.0, green: 169.0/255.0, blue: 70.0/255.0, alpha: 1)
    let profileNameTitleColor = UIColor(red: 226.0/255.0, green: 227.0/255.0, blue: 231.0/255.0, alpha: 1)
    let occupationTitleColor = UIColor(red: 201.0/255.0, green: 202.0/255.0, blue: 206.0/255.0, alpha: 1)
    let isOnlineTitleColor = UIColor(red: 109.0/255.0, green: 110.0/255.0, blue: 112.0/255.0, alpha: 1)
    let addittionalInfoTitleColor = UIColor(red: 126.0/255.0, green: 129.0/255.0, blue: 133.0/255.0, alpha: 1)
    let cellsCountsTitleColor = UIColor(red: 119.0/255.0, green: 121.0/255.0, blue: 123.0/255.0, alpha: 1)
    
    //MARK: - Fonts
    let countLabelFont = UIFont(name: "Arial", size: 15)
    let standartLabelFont = UIFont(name: "Arial", size: 17)
    let descriptionLabelFont = UIFont(name: "Arial", size: 15)
    let nameLabelFont = UIFont(name: "Guanabara Sans Bold", size: 22)
    let occupationLabelFont = UIFont(name: "Apple SD Gothic Neo", size: 16)
    let cellsCountLabelFont = UIFont(name: "Apple SD Gothic Neo", size: 14)
    
    //MARK: - Images
    let heartImage = UIImage(systemName: "heart")
    let heartFillImage = UIImage(systemName: "heart.fill")
    let commentImage = UIImage(systemName: "bubble.left")
    let shareImage = UIImage(systemName: "arrowshape.turn.up.right")
    let seenImage = UIImage(systemName: "eye")
    let checkmarkPersonImage = UIImage(systemName: "person.fill.checkmark.rtl")!
    let xmarkPersonImage = UIImage(systemName: "person.fill.xmark.rtl")!
    let creditCardImage = UIImage(systemName: "creditcard.fill")!
    let giftImage = UIImage(systemName: "gift.fill")!
    let bellImage = UIImage(systemName: "bell.fill")!
    
 
    
    func setDateFormat (_ date : Int) -> String {
        
        postTimeFormatter.dateFormat = "HH:mm"
        postDateFormatter.dateStyle = .medium
        postDateFormatter.doesRelativeDateFormatting = true
        postDateFormatter.locale = Locale(identifier: "ru_RU")
        
        let postDate = "\(postDateFormatter.string(from: Date(timeIntervalSince1970: Double(date)))) в \(postTimeFormatter.string(from: Date(timeIntervalSince1970: Double(date))))"
        
        return postDate
    }
}
