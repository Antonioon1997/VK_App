//
//  NewsCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 03.04.2021.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    
    @IBOutlet var firstStack: UIStackView!
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
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
    @IBOutlet var postTextView: UITextView?
    
    var postPhotos: [UIImageView]?
    
    
    let identifire = "FooterView"
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImages?.forEach({$0.backgroundColor = .clear})
        postImages?.forEach({$0.layer.cornerRadius = 2.5})
        
        avatarImage.layer.cornerRadius = avatarImage.layer.bounds.height/2
        avatarImage.clipsToBounds = true
        
        nameLabel.font = Presets.init().standartLabelFont
        nameLabel.textColor = .white
        
        descriptionLabel.font = Presets.init().descriptionLabelFont
        descriptionLabel.textColor = .lightGray
        
//        moreImagesView.backgroundColor = .black
//        moreImagesView.isHidden = true
        
//        moreImagesCount.font = UIFont(name: "Arial", size: 40)
//        moreImagesCount.textColor = .white
//        moreImagesCount.isHidden = true
        
//        postLabel?.font = Presets.init().standartLabelFont
//        postLabel?.textColor = .white
        postTextView?.backgroundColor = .clear
//        postTextView?.font = postLabel?.font
        postTextView?.textColor = .white
        postTextView?.dataDetectorTypes = .link
        postTextView?.font = Presets.init().standartLabelFont
        postTextView?.isUserInteractionEnabled = true
        
//        postImages?[0].tag = 0
//        postImages?.forEach({$0.isUserInteractionEnabled = false})
        
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
        
        likeImageView.tintColor = Presets.init().vkLightGray
        likeImageView.isUserInteractionEnabled = true
        
        delimetrView.backgroundColor = Presets.init().vkLightGray
        postImages?.forEach({$0.isHidden = true})
        
//        postTextView = nil
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        
        postImages?.forEach({   $0.image = nil;
                                $0.isUserInteractionEnabled = false;
                                $0.isHidden = true})
        
        
//        postTextView?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
//        postTextView?.isHidden = true
    }
    
//    func setupFeedLayout (_ count: Int) -> [UIImageView] {
//
//        switch count{
//        case 1:
//            postPhotos?.append(<#T##newElement: UIImageView##UIImageView#>)
//
//    }
}
