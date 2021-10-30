//
//  NewsCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 03.04.2021.
//

import UIKit
import AVFoundation
import AVKit

import RealmSwift

class NewsFeedCell: UITableViewCell {
    
    @IBOutlet var firstStack: UIStackView!
//    @IBOutlet var avatarImage: UIImageView!
//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var descriptionLabel: UILabel!
//
    @IBOutlet var postImages: [UIImageView]?
    
    @IBOutlet var videoView: UIView!
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
    
    @IBOutlet var twoPhotos: [UIImageView]?
    @IBOutlet var threePhotos: [UIImageView]?
    @IBOutlet var fourPhotos: [UIImageView]?
    @IBOutlet var fivePhotos: [UIImageView]?
    @IBOutlet var sixPhotos: [UIImageView]?
    @IBOutlet var sevenPhotos: [UIImageView]?
    @IBOutlet var eightPhotos: [UIImageView]?
    @IBOutlet var ninePhotos: [UIImageView]?
    @IBOutlet var tenPhotos: [UIImageView]?
    @IBOutlet var allImageViews: [UIImageView]!
    @IBOutlet var widthPhotos: [UIImageView]?
//    @IBOutlet var secondAuthorStackView: UIStackView!
//    @IBOutlet var secondAuthorNameLabel: UILabel!
//    @IBOutlet var secondAuthorTimeLabel: UILabel!
//    @IBOutlet var secondAuthorAvatarImageView: UIImageView!
    
    var isWidthPhoto = false
    let presets = Presets()
    
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Presets.init().vkDarkGray
        
//        secondAuthorStackView.isHidden = true
        allImageViews?.forEach({$0.backgroundColor = .clear})
        allImageViews?.forEach({$0.layer.cornerRadius = 2.5})
        allImageViews?.forEach({$0.isHidden = true})
        
//        avatarImage.layer.cornerRadius = avatarImage.layer.bounds.height/2
//        avatarImage.clipsToBounds = true
//
//        nameLabel.font = Presets.init().standartLabelFont
//        nameLabel.textColor = .white
//
//        descriptionLabel.font = Presets.init().descriptionLabelFont
//        descriptionLabel.textColor = .lightGray
//
//        secondAuthorAvatarImageView.layer.cornerRadius = avatarImage.layer.bounds.height/2
//        secondAuthorAvatarImageView.clipsToBounds = true
//
//        secondAuthorNameLabel.font = Presets.init().standartLabelFont
//        secondAuthorNameLabel.textColor = .white
//
//        secondAuthorTimeLabel.font = Presets.init().descriptionLabelFont
//        secondAuthorTimeLabel.textColor = .lightGray
        
        postTextView?.backgroundColor = .clear
        postTextView?.textColor = .white
        postTextView?.dataDetectorTypes = .link
        postTextView?.font = Presets.init().standartLabelFont
        postTextView?.isUserInteractionEnabled = true
        
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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {
        
        postImages?.forEach({   $0.image = nil;
                                $0.isUserInteractionEnabled = false;
                                $0.isHidden = true})
        postImages?.removeAll()
        allImageViews.forEach({$0.isHidden = true})
//        secondAuthorStackView.isHidden = true
        videoView?.isHidden = true
    }
    
    func setupFeedLayout (_ count: Int) {
        
        switch count{
        case 0:
            postImages = widthPhotos
        case 1...2:
            postImages = twoPhotos
        case 3:
            postImages = threePhotos
        case 4:
            postImages = fourPhotos
        case 5:
            postImages = fivePhotos
        case 6:
            postImages = sixPhotos
        case 7:
            postImages = sevenPhotos
        case 8:
            postImages = eightPhotos
        case 9:
            postImages = ninePhotos
        default:
            postImages = tenPhotos
        }
    }
}

extension NewsFeedCell {
    
//    func setOneAuthor(_ postAuthor: [Group?], _ postAuthID: Int) {
//
//        guard let author = postAuthor.filter({$0?.id == -postAuthID})[0] else { return }
//        avatarImage.kf.setImage(with: URL(string: author.photo50))
//        nameLabel.text = author.name
//    }
//
//    func setOneUserAuthor(_ postAuthor: VKUserProfileRealm?) {
//
//        guard let author = postAuthor else { return }
//        let userName = author.firstName + " " + author.lastName
//        avatarImage.kf.setImage(with: URL(string: author.photo50 ?? ""))
//        nameLabel.text = userName
//    }
//
//    func setTwoAuthor(_ postAuthor: [Group?], _ postAuthID: Int , postUser: Results<VKUserProfileRealm>?) {
//
//        guard let group = postAuthor.filter({$0?.id == postAuthID})[0],
//              let user = postUser?[0]
//        else { return }
//        secondAuthorStackView.isHidden = false
//        avatarImage.kf.setImage(with: URL(string: user.photo100 ?? user.photo50 ?? ""))
//        let userName = user.firstName + " " + user.lastName
//        nameLabel.text = userName
//
//        secondAuthorAvatarImageView.kf.setImage(with: URL(string: group.photo50))
//        secondAuthorNameLabel.text = group.name
//    }
    
    func setWall(_ items : Item?, _ attatchments: [Attachments]?,_ indexPath: IndexPath) {
        guard let item = items,
              let attatch = attatchments else { return }
        
        for photo in 0..<attatch.count {
//
            if attatch[photo].type == "photo"
               
               {
                let postPhoto = attatch[photo].photo?.sizes.last?.url
                
                if photo == 0 && isWidthPhoto == true {
                    setupFeedLayout(0)
                }
                setupFeedLayout(attatch.count)
                postImages?[photo].isHidden = false
                postImages?[photo].kf.setImage(with: URL(string: postPhoto ?? ""))
                postImages?[photo].contentMode = setContentMode(postPhoto)
                postImages?[photo].tag = indexPath.row * 10 + photo
                postImages?[photo].isUserInteractionEnabled = true
            }
            else if attatch[photo].type == "video" {
//                videoView.isHidden = false
//                playVideo("https://youtu.be/UF7O4P3h-hA")
                guard let videoImage = attatch[photo].video?.photo800 ?? attatch[photo].video?.photo320
                else { return }
                setupFeedLayout(0)
                postImages?[0].isHidden = false
                postImages?[0].kf.setImage(with: URL(string: videoImage))
                
                
                
            }
        }
            if item.text != nil {
                
                postTextView?.sizeToFit()
                postTextView?.text = item.text
            }
            guard let date = item.date else {
//                descriptionLabel.text = ""
                return
            }
//            descriptionLabel.text = presets.setDateFormat(date)
            guard
                let likes = item.likes?.count,
                let reposts = item.reposts?.count,
                let comments = item.comments?.count
            else { return }

            likeCountLabel.text = String(describing: likes)
            shareCountLabel.text = String(describing: reposts)
            commentCountLabel.text = String(describing: comments)
            seenCountLabel.text = ""
        }
    
    
    private func setContentMode(_ photoURL: String?) -> UIView.ContentMode {
        
        guard photoURL?.contains("size") == true,
            let photoResolution = photoURL?.components( separatedBy: "=")[1]
                                       .components(separatedBy: "&")[0]
                                       .components(separatedBy: "x")
        else { return .scaleAspectFit}
        
        guard let photoWidth = Double(photoResolution[0]),
              let photoHeight = Double(photoResolution[1])
        else { return .scaleAspectFill }

        
        
        switch photoWidth / photoHeight {
        case 0...1:
            return .scaleToFill
        case 1.001...1.3:
            return .redraw
        default:
            isWidthPhoto = true
            return .scaleAspectFill
        }
    }
    
    
}
