//
//  NewsFeedHeaderCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 26.10.2021.
//

import UIKit

class NewsFeedHeaderCell: UITableViewCell {

    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var ownerNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setStyle()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setStyle () {
        
        avatarImageView.layer.cornerRadius = avatarImageView.layer.bounds.height/2
        avatarImageView.clipsToBounds = true
        
        ownerNameLabel.font = Presets.init().standartLabelFont
        ownerNameLabel.textColor = .white
        
        dateLabel.font = Presets.init().descriptionLabelFont
        dateLabel.textColor = .lightGray
        
        self.backgroundColor = Presets.init().vkDarkGray
    }
    
}
