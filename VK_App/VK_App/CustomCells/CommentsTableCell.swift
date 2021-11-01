//
//  CommentsTableCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 28.07.2021.
//

import UIKit

class CommentsTableCell: UITableViewCell {
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var userAvatar: UIImageView!
    @IBOutlet var comment: UITextView!
    @IBOutlet var commentTime: UILabel!
    @IBOutlet var unswerButton: UIButton!
    @IBOutlet var likeImage: UIImageView!
    @IBOutlet var likeCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Presets.init().vkDarkGray
        
        userAvatar.layer.cornerRadius = userAvatar.layer.bounds.height/2
        userAvatar.clipsToBounds = true
        
        userName.font = Presets.init().standartLabelFont
        userName.textColor = .white
        
        commentTime.font = Presets.init().descriptionLabelFont
        commentTime.textColor = .lightGray
        
        comment.backgroundColor = .clear
        comment.textColor = .white
        comment.dataDetectorTypes = .link
        comment.font = Presets.init().standartLabelFont
        comment.isUserInteractionEnabled = true
        
        likeImage.tintColor = Presets.init().vkLightGray
        likeImage.isUserInteractionEnabled = true
        
        unswerButton.setTitle("Ответить", for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
