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
    var currentNewsAuthor: [Group?] = []
    var authorID: Int?
    var cellTag: Int!
    var isWidthPhoto = false
    let countOfComments = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        self.tableView.register(UINib(nibName: "CommentsTableCell", bundle: nil), forCellReuseIdentifier: "CommentsTableCell")
        self.view.backgroundColor = Presets.init().vkDarkGray
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        else { return countOfComments }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let commentsCell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableCell", for: indexPath) as! CommentsTableCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell
        
        
        if indexPath.section == 0 {
        guard
            let postAuthID = authorID
        else { return cell }
            
//            cell.setOneAuthor(currentNewsAuthor, postAuthID)
            cell.setWall(currentNewsAttach, currentNewsAttach?.attachments, indexPath)
            cell.postImages?.forEach({$0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPhotoTapGestureRecognizer)))})

            cell.selectionStyle = .none
            
            return cell
            
        } else {
            
            commentsCell.likeCount.text = "0"
            commentsCell.likeImage.image = Presets.init().heartImage
            commentsCell.userAvatar.kf.setImage(with: URL(string: "https://sun9-67.userapi.com/impg/fafvmpfXVZ5qEi759zx9zxyUMwcTsFWXLU45-Q/bE5S_8FRHhQ.jpg?size=2446x2160&quality=96&sign=51a6067bb86ae7a241afdfaabcf452e9&type=album"))
            commentsCell.userName.text = "Антон Онищенко"
            commentsCell.comment.text = "К сожалению, запрос комментариев временно недоступен в виду ограниченных прав"
            commentsCell.commentTime.text = "Временно"

        }
        return commentsCell
//        return cell
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
