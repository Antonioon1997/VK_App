//
//  NewsFeedTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.04.2021.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {
    
    var indexPathForPhoto: IndexPath!
    var cellTag: Int!
    var imageTag: Int!
    var photoForFullscreen: UIImageView!
    
    var newsPosts = [
        NewsFeed(authorName: "Reddit", authorDescription: "Russia moment", authorAvatar: UIImage(named: "Reddit"), postText: "Russia moment", postImages: [UIImage(named: "Reddit.post.1"), UIImage(named: "Reddit.post.2")], isLiked: true, likeCount: 10898, commentCount: 1311, shareCount: 1028, seenCount: 170000),
        NewsFeed(authorName: "Reddit", authorDescription: "17 минут назад", authorAvatar: UIImage(named: "Reddit"), postText: "bruh", postImages: [UIImage(named: "Reddit.post.2")], isLiked: false, likeCount: 142, commentCount: 31, shareCount: 123, seenCount: 41231),
        NewsFeed(authorName: "Reddit", authorDescription: "34 минуты назад", authorAvatar: UIImage(named: "Reddit"), postText: "Zoom Eternal", postImages: [UIImage(named: "Reddit.post.3")], isLiked: false, likeCount: 923, commentCount: 572, shareCount: 4234, seenCount: 43242),
        NewsFeed(authorName: "Вижу рифмы", authorDescription: "2 часа назад", authorAvatar: UIImage(named: "Вижу рифмы"), postText: "Как-то неуклюже \nЗаурчал животик", postImages: [UIImage(named: "Вижу рифмы.post.1")], isLiked: true, likeCount: 13, commentCount: 442, shareCount: 32, seenCount: 33222),
        NewsFeed(authorName: "Zлой Zаяй", authorDescription: "3 дня назад", authorAvatar: UIImage(named: "Zлой Zаяц"), postText: "Тоже самое с котами и хозяевами", postImages: [UIImage(named: "Zлой Zаяц.post.1")], isLiked: false, likeCount: 323, commentCount: 123, shareCount: 324, seenCount: 14523),
        NewsFeed(authorName: "Вижу рифмы", authorDescription: "Вчера в 17:33", authorAvatar: UIImage(named: "Вижу рифмы"), postText: nil, postImages: [UIImage(named: "Вижу рифмы.post.2"), UIImage(named: "Вижу рифмы.post.2.2"), UIImage(named: "Вижу рифмы.post.2.3"), UIImage(named: "Вижу рифмы.post.2.4"), UIImage(named: "Вижу рифмы.post.2.5"), UIImage(named: "Вижу рифмы.post.2.6"), UIImage(named: "Вижу рифмы.post.2.7"), UIImage(named: "Вижу рифмы.post.2.8")], isLiked: true, likeCount: 323, commentCount: 529, shareCount: 19, seenCount: 23332),
        NewsFeed(authorName: "Zлой Zаяц", authorDescription: "Сегодня в 11:14", authorAvatar: UIImage(named: "Zлой Zаяц"), postText: "Пранк замедленного действия", postImages:[UIImage(named: "Zлой Zаяц.post.2")], isLiked: true, likeCount: 749, commentCount: 35, shareCount: 15, seenCount: 27395),
        NewsFeed(authorName: "Reddit", authorDescription: "13.03.2021", authorAvatar: UIImage(named: "Reddit"), postText: "fact-checked", postImages: [UIImage(named: "Reddit.post.4")], isLiked: false, likeCount: 313, commentCount: 73, shareCount: 9, seenCount: 3132)
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
       
        self.navigationController?.navigationBar.barTintColor = Presets.init().vkDarkGray
        
        
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 5))
        self.tableView.contentInset = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newsPosts.count
    }
     
    //MARK: - Cell View
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell

        let postData = newsPosts[indexPath.row]
        
        cell.selectionStyle = .none

        cell.indexPath = indexPath
//        print (cell.indexPath)
        cell.avatarImage.image = postData.authorAvatar
        cell.nameLabel.text = postData.authorName
        cell.descriptionLabel.text = postData.authorDescription
        cell.postLabel?.text = postData.postText
        if postData.isLiked == true {
            cell.likeImageView.image = Presets.init().heartFillImage
        } else if postData.isLiked == false {
            cell.likeImageView.image = Presets.init().heartImage
        }
        cell.likeCountLabel.text = String(describing: postData.likeCount!)
        cell.commentCountLabel.text = String(describing: postData.commentCount!)
        cell.shareCountLabel.text = String(describing: postData.shareCount!)
        cell.seenCountLabel.text = String(describing: postData.seenCount!)
        
        cell.isLiked = postData.isLiked
        cell.likeCount = postData.likeCount
   
        cell.postImages?.forEach({$0.tag = indexPath.row})
        
        for image in 0...postData.postImages.count - 1  {
           
            if image <= 3 {
                cell.postImages?[image].tag = indexPath.row
                cell.postImages?[image].isHidden = false
                cell.postImages?[image].image = postData.postImages[image]
                cell.postImages?[image].addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                                    action: #selector(openPhotoTapGestureRecognizer)))
            } else {
                cell.moreImagesCount.isHidden = false
                cell.moreImagesView.isHidden = false
                cell.postImages?[3].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showMorePhotos)))
                cell.postImages?[3].alpha = 0.5
                cell.moreImagesCount?.text = "+\(postData.postImages.count - 4)"
                
                break
            }
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellTag = indexPath.row
        performSegue(withIdentifier: "ShowNewsDetail", sender: self)
    }
   
    @objc func openPhotoTapGestureRecognizer ( sender: UITapGestureRecognizer, photoIndexPath: Int) {

        cellTag = sender.view?.tag
        imageTag = photoIndexPath
        performSegue(withIdentifier: "ShowFullscreenNewsPhoto", sender: nil)
    }
    
    @objc func showMorePhotos ( sender: UITapGestureRecognizer){
        
        cellTag = sender.view?.tag
        performSegue(withIdentifier: "ShowNewsDetail", sender: self)
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowFullscreenNewsPhoto",
           let destination = segue.destination as? FeedNewsFullscreenPhotoViewController
           {
            destination.photosFromNews = newsPosts[cellTag]
            destination.photoIndexPathInt = 0
        } else if segue.identifier == "ShowNewsDetail",
                  let destination = segue.destination as? DetailNewsTableViewController {
            destination.currentNews = newsPosts[cellTag]
            
        }
    }
   
}
