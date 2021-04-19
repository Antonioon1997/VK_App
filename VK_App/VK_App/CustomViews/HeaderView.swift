//
//  HeaderView.swift
//  VK_App
//
//  Created by Антон Онищенко on 09.04.2021.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet var backgroundViewColor: UIView!
    @IBOutlet var delimetrView: UIView!
    
    let identifire = "HeaderView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundViewColor.backgroundColor = Presets.init().vkDarkGray
        delimetrView.backgroundColor = Presets.init().vkLightGray
        
    }

}
