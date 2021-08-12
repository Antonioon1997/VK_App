//
//  ProfilePhotosPrewievTableCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 03.08.2021.
//

import UIKit

class ProfilePhotosPrewievTableCell: UITableViewCell {

    @IBOutlet var photosLabel: UILabel!
    @IBOutlet var photosCountLabel: UILabel!
    @IBOutlet var photosImageViews: [UIImageView]?
    
    let preset = Presets()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Presets.init().vkDarkGray
        
        photosImageViews?.forEach({ $0.layer.cornerRadius = 5;
                                    $0.clipsToBounds = true;
                                    $0.contentMode = .scaleAspectFill})
  
        
        
        photosLabel.text = "ФОТОГРАФИИ"
        photosLabel.font = preset.standartLabelFont
        photosLabel.textColor = preset.profileNameTitleColor
        photosCountLabel.font = preset.standartLabelFont
        photosCountLabel.textColor = preset.cellsCountsTitleColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
