//
//  NewsCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 03.04.2021.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var postLabel: UILabel?
    @IBOutlet var moreImagesView: UIView!
    @IBOutlet var moreImagesCount: UILabel!
    @IBOutlet var postImages: [UIImageView]?
    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var commentImageView: UIImageView!
    @IBOutlet var commentCountLabel: UILabel!
    @IBOutlet var shareImageView: UIImageView!
    @IBOutlet var shareCountLabel: UILabel!
    @IBOutlet var seenImageView: UIImageView!
    @IBOutlet var seenCountLabel: UILabel!
    @IBOutlet var delimetrView: UIView!
    
    var isLiked: Bool!
    
    
    var likeCount: Int!
    
    var likeImage: UIImage! {
        get { likeImageView.image }
        set { likeImageView.image = newValue}
    }
    
    let identifire = "FooterView"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImage.layer.cornerRadius = avatarImage.layer.bounds.height/2
        avatarImage.clipsToBounds = true
        
        nameLabel.font = Presets.init().standartLabelFont
        nameLabel.textColor = .white
        
        descriptionLabel.font = Presets.init().descriptionLabelFont
        descriptionLabel.textColor = .lightGray
        
        moreImagesView.backgroundColor = .black
        moreImagesView.isHidden = true
        
        moreImagesCount.font = UIFont(name: "Arial", size: 40)
        moreImagesCount.textColor = .white
        moreImagesCount.isHidden = true
        
        postLabel?.font = Presets.init().standartLabelFont
        postLabel?.textColor = .white
        
        postImages?.forEach({$0.isHidden = true})
        
        self.backgroundColor = Presets.init().vkDarkGray
        
        likeCountLabel.font = Presets.init().countLabelFont
        likeCountLabel.textColor = Presets.init().vkLightGray
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
        
        delimetrView.backgroundColor = Presets.init().vkLightGray
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
