//
//  HeaderFooterView.swift
//  VK_App
//
//  Created by Антон Онищенко on 07.04.2021.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {
    
    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var commentImageView: UIImageView!
    @IBOutlet var commentCountLabel: UILabel!
    @IBOutlet var shareImageView: UIImageView!
    @IBOutlet var shareCountLabel: UILabel!
    @IBOutlet var seenImageView: UIImageView!
    @IBOutlet var seenCountLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    var isLiked: Bool!
    var likeCount: Int!
    
    var likeImage: UIImage! {
        get { likeImageView.image }
        set { likeImageView.image = newValue}
    }
    
    let identifire = "FooterView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColorView.backgroundColor = Presets.init().vkDarkGray
        
        likeCountLabel.font = Presets.init().countLabelFont
        likeCountLabel.textColor = Presets.init().vkLightGray
        likeImageView.image = Presets.init().heartImage
        likeImageView.tintColor = Presets.init().vkLightGray
        
        commentCountLabel.font = Presets.init().countLabelFont
        commentCountLabel.textColor = Presets.init().vkLightGray
        commentImageView.image = Presets.init().commentImage
        commentImageView.tintColor = Presets.init().vkLightGray
        
        shareCountLabel.font = Presets.init().countLabelFont
        shareCountLabel.textColor = Presets.init().vkLightGray
        shareImageView.image = Presets.init().shareImage
        shareImageView.tintColor = Presets.init().vkLightGray
        
        seenCountLabel.font = Presets.init().countLabelFont
        seenCountLabel.textColor = Presets.init().vkLightGray
        seenImageView.image = Presets.init().seenImage
        seenImageView.tintColor = Presets.init().vkLightGray
        
        let isLikedTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        likeImageView.isUserInteractionEnabled = true
        likeImageView.addGestureRecognizer(isLikedTapGestureRecognizer)
    }
    
    
    
    @objc func likeTapped() {
        
        
        if isLiked == true {
            likeCount -= 1
            likeCountLabel.text = String(describing: likeCount!)
            likeImage = Presets.init().heartImage
        } else if isLiked == false {
            likeCount += 1
            likeCountLabel.text = String(describing: likeCount!)
            likeImage = Presets.init().heartFillImage
        }
        isLiked.toggle()
        
        
        
    }
}
