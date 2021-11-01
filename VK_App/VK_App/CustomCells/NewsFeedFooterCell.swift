//
//  NewsFeedFooterCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 27.10.2021.
//

import UIKit

class NewsFeedFooterCell: UITableViewCell {

    @IBOutlet var likeImageView: UIImageView!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var commentImageView: UIImageView!
    @IBOutlet var commentCountLabel: UILabel!
    @IBOutlet var shareImageView: UIImageView!
    @IBOutlet var shareCountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Presets.init().vkDarkGray
        setFooterDesign()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    private func setFooterDesign() {

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
    }
}
