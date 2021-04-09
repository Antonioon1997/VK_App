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
    @IBOutlet weak var bottomBar: BottomBar!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
//        self.addSubview(bottomBar)
//        self.bottomBar.likeImage = UIImage(named: "SAUCE")
        
        avatarImage.layer.cornerRadius = avatarImage.layer.bounds.height/2
        avatarImage.clipsToBounds = true
        
        nameLabel.font = UIFont(name: "Arial", size: 16)
        nameLabel.textColor = .white
        
        descriptionLabel.font = UIFont(name: "Arial", size: 12)
        descriptionLabel.textColor = .lightGray
        
        moreImagesView.backgroundColor = .black
        moreImagesView.isHidden = true
        
        moreImagesCount.font = UIFont(name: "Arial", size: 40)
        moreImagesCount.textColor = .white
        moreImagesCount.isHidden = true
        
        postLabel?.font = UIFont(name: "Arial", size: 16)
        postLabel?.textColor = .white
        
        postImages?.forEach({$0.isHidden = true})
        
        self.backgroundColor = Colors.init().vkDarkGray
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
