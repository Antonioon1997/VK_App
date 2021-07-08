//
//  DetailNewsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 26.04.2021.
//

import UIKit
import Kingfisher

class DetailNewsTableViewController: UITableViewController {

//    var currentNews: NewsFeed?
    var currentNewsAttach: Item?
    var currentNewsAuthor: Group?
    var cellTag: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        self.view.backgroundColor = Presets.init().vkDarkGray
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell
        guard
            let postAttatch = currentNewsAttach,
            let postAuthor = currentNewsAuthor,
            let date = postAttatch.date,
            let postLikes = currentNewsAttach?.likes?.count,
            let postResposts = currentNewsAttach?.reposts?.count,
            let postComments = currentNewsAttach?.comments?.count,
            let postViews = currentNewsAttach?.views?.count
        
        else { return cell }
        
        cell.selectionStyle = .none

        
        let postTimeFormatter = DateFormatter()
        let postDateFormatter = DateFormatter()
        postTimeFormatter.dateFormat = "HH:mm"
        postDateFormatter.dateStyle = .medium
        postDateFormatter.doesRelativeDateFormatting = true
        postDateFormatter.locale = Locale(identifier: "ru_RU")
        
        let postDate = "\(postDateFormatter.string(from: Date(timeIntervalSince1970: Double(date)))) в \(postTimeFormatter.string(from: Date(timeIntervalSince1970: Double(date))))"
        
//        cell.indexPath = indexPath
        cell.avatarImage.kf.setImage(with: URL(string: postAuthor.photo200 ?? ""))
        cell.nameLabel.text = postAuthor.name
        cell.descriptionLabel.text = postDate
        cell.postTextView?.text = postAttatch.text
//        if postData.isLiked == true {
//            cell.likeImageView.image = Presets.init().heartFillImage
//        } else if postData.isLiked == false {
//            cell.likeImageView.image = Presets.init().heartImage
//        }
        cell.likeCountLabel.text = String(describing: postLikes)
        cell.shareCountLabel.text = String(describing: postResposts)
        cell.commentCountLabel.text = String(describing: postComments)
        cell.seenCountLabel.text = String(describing: postViews)
        
//        cell.isLiked = postData.isLiked
//        cell.likeCount = postData.likeCount
   
        guard let count = currentNewsAttach?.attachments?.count,
              let photos = currentNewsAttach?.attachments
        else { return cell }
        
        for photo in 0..<count {
            if photos[photo].type == "photo" {
                cell.postImages?[photo].isHidden = false
                cell.postImages?[photo].kf.setImage(with: URL(string: photos[photo].photo?.sizes?.last?.url ?? ""))
                cell.postImages?[photo].tag = photo
                cell.postImages?[photo].isUserInteractionEnabled = true
                
            }
            cell.postImages?.forEach({$0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPhotoTapGestureRecognizer)))})
        }

        cell.postImages?.forEach({$0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPhotoTapGestureRecognizer)))})
        
        return cell
    }
    
    @objc func openPhotoTapGestureRecognizer (_ sender: UITapGestureRecognizer) {

        cellTag = sender.view?.tag
        performSegue(withIdentifier: "ShowFullscreenNewsPhoto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFullscreenNewsPhoto",
           let destination = segue.destination as? FeedNewsFullscreenPhotoViewController {
//            destination.photosFromNews = currentNews
            guard let photos = currentNewsAttach?.attachments
            else { return }
            destination.photos2 = photos
            destination.photoIndexPathInt = cellTag
        }
    }
}
