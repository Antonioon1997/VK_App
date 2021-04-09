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
    
    let identifire = "FooterView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
