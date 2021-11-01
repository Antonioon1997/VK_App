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
        
        newsFeedText.backgroundColor = .clear
        newsFeedText.textColor = .white
        newsFeedText.dataDetectorTypes = .link
        newsFeedText.font = Presets.init().standartLabelFont
        
        self.backgroundColor = Presets.init().vkDarkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
