//
//  NewsFeedTextMain.swift
//  VK_App
//
//  Created by Антон Онищенко on 27.10.2021.
//

import UIKit

class NewsFeedTextMain: UITableViewCell {

    @IBOutlet var newsFeedText: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsFeedText.textContainer.maximumNumberOfLines = 7
        newsFeedText.isEditable = false
        newsFeedText.textColor = .white
//        firstImageView.backgroundColor = .clear
        self.backgroundColor = Presets.init().vkDarkGray
        newsFeedText.backgroundColor = Presets.init().vkDarkGray
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        
    }
    
//    func setImageViewSize(_ num: Double) {
//        
//        firstImageView.heightAnchor.constraint(equalTo: firstImageView.widthAnchor, multiplier: 1.0/5.0).isActive = true
//            
//        
//        firstImageView.frame.size.height = 100
//        
////        firstImageView.frame.size = CGSize(width: 20, height: 20)
//        
//    }
    
}
