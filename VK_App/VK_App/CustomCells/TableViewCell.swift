//
//  TableViewCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 29.10.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    var firstImageView : UIImageView  = {
        let firstImage = UIImageView()
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        firstImage.backgroundColor = .clear
        return firstImage
    } ()
    var secondImageView : UIImageView  = {
        let firstImage = UIImageView()
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        firstImage.backgroundColor = .clear
        return firstImage
    } ()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.addSubview(firstImageView)
        self.addSubview(secondImageView)
        
        setConstraints(firstImageView)
        setConstraints(secondImageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setConstraints (_ imageView: UIImageView) {
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
}
