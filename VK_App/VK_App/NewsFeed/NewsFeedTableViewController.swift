//
//  NewsFeedTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.04.2021.
//

import UIKit
import AVKit

class NewsFeedTableViewController: UITableViewController {
    
    var indexPathForPhoto: IndexPath!
    var cellTag: Int!
    var imageTag: Int!
    var postTextTag: Int!
    var photoForFullscreen: UIImageView!
    let networkService = NetworkService()
    var news = [Response]()
    var newsAttach = [Item?] ()
    var newsAuthor = [Group?] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
       
        self.navigationController?.navigationBar.barTintColor = Presets.init().vkDarkGray
        
        
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 5))
        self.tableView.contentInset = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        
        networkService.getNews { [weak self] response in
            guard let newss = response else {return}
            self?.news = [newss]
            self?.newsAttach = newss.items.filter({$0?.postType == "post"})
            self?.newsAuthor = newss.groups
            
//            print(self?.news)
//            print(newss)
//            print(self?.news.count)
            self?.tableView.reloadData()
        }
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return news.count
        guard !news.isEmpty else {return 0}
        return newsAttach.count
        
    }
     
    //MARK: - Cell View
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell
        
        
        guard
            let sourceID = newsAttach[indexPath.row]?.sourceID,
            let postAuth = newsAuthor.filter({$0?.id == -sourceID}).first,
            let date = newsAttach[indexPath.row]?.date
            
        
            else { return cell }
        
        
//        let newsAttatch = newsAttach.filter({$0?.postType != nil})
        let postTimeFormatter = DateFormatter()
        let postDateFormatter = DateFormatter()
        postTimeFormatter.dateFormat = "HH:mm"
        postDateFormatter.dateStyle = .medium
        postDateFormatter.doesRelativeDateFormatting = true
        postDateFormatter.locale = Locale(identifier: "ru_RU")
        
        let postDate = "\(postDateFormatter.string(from: Date(timeIntervalSince1970: Double(date)))) в \(postTimeFormatter.string(from: Date(timeIntervalSince1970: Double(date))))"
        cell.postTextView?.tag = indexPath.row
        cell.postTextView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedPostText)))
        
        cell.avatarImage.kf.setImage(with: URL(string: (postAuth?.photo200)!))
        cell.nameLabel.text = postAuth?.name
        cell.descriptionLabel.text = postDate
        guard let postAttach = newsAttach[indexPath.row]?.attachments?.filter({$0.type != "video"}),
              let postInfo = newsAttach[indexPath.row],
              let postLikes = postInfo.likes?.count,
              let postResposts = postInfo.reposts?.count,
              let postComments = postInfo.comments?.count,
              let postViews = postInfo.views?.count
            
            
        else {
            
            cell.postTextView?.text = "  Тут видос "
            return cell
        }
        
        
        for photo in 0..<postAttach.count {
            if postAttach[photo].type == "photo" {
            cell.postImages?[photo].isHidden = false
            cell.postImages?[photo].kf.setImage(with: URL(string: postAttach[photo].photo?.sizes?.last?.url ?? ""))
                cell.postImages?[photo].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedPhotoView)))
            }
        }
        
        if newsAttach[indexPath.row]?.text != nil {
            
            cell.postTextView?.sizeToFit()
        cell.postTextView?.text = newsAttach[indexPath.row]?.text
        }
        
        cell.likeCountLabel.text = String(describing: postLikes)
        cell.shareCountLabel.text = String(describing: postResposts)
        cell.commentCountLabel.text = String(describing: postComments)
        cell.seenCountLabel.text = String(describing: postViews)
        
        
        return cell
//        cell.postImages[0].is
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellTag = indexPath.row
        performSegue(withIdentifier: "ShowNewsDetail", sender: self)
    }
   
    @objc func tappedPhotoView (_ sender: UITapGestureRecognizer,_ photoIndexPath: Int) {

        cellTag = sender.view?.tag
//        sender.view?.isFocused = true
        
        
        
//        imageTag = photoIndexPath
        performSegue(withIdentifier: "ShowFullscreenNewsPhoto", sender: nil)
    }
    
    @objc func tappedPostText(_ sender: UITapGestureRecognizer, _ postTextIndexPath: Int) {
        cellTag = sender.view?.tag
        performSegue(withIdentifier: "ShowNewsDetail", sender: self)
//        postTextTag = po
    }
    
    @objc func showMorePhotos ( sender: UITapGestureRecognizer){
        
        cellTag = sender.view?.tag
        performSegue(withIdentifier: "ShowNewsDetail", sender: self)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*if segue.identifier == "ShowFullscreenNewsPhoto",
           let destination = segue.destination as? FeedNewsFullscreenPhotoViewController
           {
            destination.photosFromNews = newsAttach[cellTag]
            destination.photoIndexPathInt = 0
        } else */if segue.identifier == "ShowNewsDetail",
                  let destination = segue.destination as? DetailNewsTableViewController {
            destination.currentNewsAttach = newsAttach[cellTag]
            let currentAuthor = newsAuthor.filter({$0?.id == -(newsAttach[cellTag]?.sourceID ?? 0)})
            destination.currentNewsAuthor = currentAuthor[0]
            
        }
    }
   
}
