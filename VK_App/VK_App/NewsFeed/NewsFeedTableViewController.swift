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
    var newsAttach = [Item?] ()
    var newsAuthor = [Group?] ()
    var isWidthPhoto = false

    
    let postTimeFormatter = DateFormatter()
    let postDateFormatter = DateFormatter()
    var postDate: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
       
        self.navigationController?.navigationBar.barTintColor = Presets.init().vkDarkGray
        networkService.getPermission()
        
        
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 5))
        self.tableView.contentInset = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        
        networkService.getNews { [weak self] response in
            guard let groups = response?.groups,
                  let items = response?.items?.filter({$0.postType != nil})
            
            else {
                self?.tableView.reloadData()
                return }
            
            self?.newsAuthor = groups
            self?.newsAttach = items
//            let groupsRealm = news.groups.map({VKGroupsRealm{$0}})
            
            self?.tableView.reloadData()
        }
    }
}

extension NewsFeedTableViewController {
  
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard !newsAttach.isEmpty else {return 0}
        return newsAttach.count
    }
     
    
    
    //MARK: - Cell View
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell
        
        guard
            let sourceID = newsAttach[indexPath.row]?.sourceID,
            let attatchemnts = newsAttach[indexPath.row]
        else { return cell }
       
        cell.setOneAuthor(newsAuthor, sourceID)
        cell.setWall(attatchemnts, attatchemnts.attachments)
        
        cell.postTextView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedPostText)))
        
        cell.postImages?.forEach({$0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedPhotoView)))})
        
        isWidthPhoto = false
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellTag = indexPath.row
        performSegue(withIdentifier: "ShowNewsDetail", sender: self)
    }
   
    @objc func tappedPhotoView (_ sender: UITapGestureRecognizer,_ photoIndexPath: Int) {

        cellTag = sender.view?.tag
        performSegue(withIdentifier: "ShowFullscreenNewsPhoto", sender: nil)
    }
    
    @objc func tappedPostText(_ sender: UITapGestureRecognizer, _ postTextIndexPath: Int) {
        
        cellTag = sender.view?.tag
        performSegue(withIdentifier: "ShowNewsDetail", sender: self)
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
            let currentAuthor = newsAuthor
            destination.currentNewsAuthor = currentAuthor
            destination.authorID = newsAttach[cellTag]?.sourceID
        }
    }
    
}
