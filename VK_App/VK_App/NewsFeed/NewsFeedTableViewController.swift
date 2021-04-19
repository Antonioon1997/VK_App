//
//  NewsFeedTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.04.2021.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {
    
    var indexPathForFooter: Int!
    
    var newsPosts = [
        NewsFeed(authorName: "Reddit", authorDescription: "Russia moment", authorAvatar: UIImage(named: "Reddit"), postText: "Russia moment", postImages: [UIImage(named: "Reddit.post.1")], isLiked: true, likeCount: 10898, commentCount: 1311, shareCount: 1028, seenCount: 170000),
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
        
        self.tableView.register(UINib(nibName: "FooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "FooterView")
        
        self.tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
        
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
        
        indexPathForFooter = indexPath.row
        
        for image in 0...postData.postImages.count - 1  {
            if image <= 3 {
                cell.postImages?[image].isHidden = false
                cell.postImages?[image].image = postData.postImages[image]
            }
            else {
                cell.moreImagesCount.isHidden = false
                cell.moreImagesView.isHidden = false
                cell.postImages?[3].alpha = 0.5
                cell.moreImagesCount?.text = "+\(postData.postImages.count - 4)"
            
                break
            }
        }
        
        return cell
    }
//    
//    //MARK: - Header View
//    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
//        
//        header.delimetrView.backgroundColor = Presets.init().vkLightGray
//        header.backgroundViewColor.backgroundColor = Presets.init().vkDarkGray
//        
//        return header
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        
//        return 5
//    }
//    
//    //MARK: - Footer View
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterView") as! FooterView
//        
//        let footer = newsPosts[indexPathForFooter]
//        
//        
//        footerView.likeCount = footer.likeCount
//        footerView.likeCountLabel.text = String(describing: footerView.likeCount!)
//        
//        
//        footerView.commentCountLabel.text = String(describing: footer.commentCount!)
//        footerView.shareCountLabel.text = String(describing: footer.shareCount!)
//        footerView.seenCountLabel.text = String(describing: footer.seenCount!)
//        
//        footerView.isLiked = footer.isLiked
//        
//        if footer.isLiked == true { footerView.likeImageView.image = Presets.init().heartFillImage }
//        else if footer.isLiked == false {
//            footerView.likeImageView.image = Presets.init().heartImage
//        }
//        
//        return footerView
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        
//        return 40
//    }

}
