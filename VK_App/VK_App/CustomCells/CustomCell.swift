//
//  CustomCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 01.04.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var avatarImage: UIImageView!
//    @IBOutlet var shadowView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var isOnlineView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        
        nameLabel.font = UIFont(name: "Arial", size: 17)
        nameLabel.textColor = .white
        
        descriptionLabel.font = UIFont(name: "Arial", size: 11)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.isHidden = true
        
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.layer.bounds.height/2
        
        isOnlineView.layer.cornerRadius =  isOnlineView.layer.bounds.height/2
        isOnlineView.backgroundColor = .clear
        
        messageButton.setImage(UIImage(systemName: "message",
                                       withConfiguration: UIImage.SymbolConfiguration(
                                                pointSize: avatarImage.layer.frame.size.height * 0.3,
                                                weight: .medium,
                                                scale: .large)),
                                                for: .normal)
        messageButton.setTitle(nil, for: .normal)
        
        callButton.setImage(UIImage(systemName: "phone",
                                    withConfiguration: UIImage.SymbolConfiguration(
                                                pointSize: avatarImage.layer.frame.size.height * 0.4,
                                                weight: .light,
                                                scale: .large)),
                                                for: .normal)
        callButton.setTitle(nil, for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
