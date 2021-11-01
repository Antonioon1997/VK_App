//
//  ProfileFriendsCollectionCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.07.2021.
//

import UIKit

class ProfileFriendsCollectionCell: UICollectionViewCell {
    
    @IBOutlet var friendAvatar: UIImageView!
    @IBOutlet var frindName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendAvatar.layer.cornerRadius = (friendAvatar.bounds.height)/2
        friendAvatar.clipsToBounds = true
        
        frindName.font = UIFont(name: "Apple SD Gothic Neo", size: 12)
        
//        frindName.textColor = .white
        
        
    }
    

    

}
