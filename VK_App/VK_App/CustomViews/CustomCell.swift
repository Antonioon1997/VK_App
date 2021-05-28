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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        
        nameLabel.font = UIFont(name: "Arial", size: 20)
        nameLabel.textColor = .white
        
        descriptionLabel.font = UIFont(name: "Arial", size: 12)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.isHidden = true
        
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.layer.bounds.height/2
        
//        shadowView.clipsToBounds = false
//        shadowView.layer.cornerRadius = shadowView.layer.bounds.height/2
//        shadowView.layer.shadowColor = UIColor.white.cgColor
//        shadowView.layer.shadowRadius = 3
//        shadowView.layer.shadowOpacity = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
