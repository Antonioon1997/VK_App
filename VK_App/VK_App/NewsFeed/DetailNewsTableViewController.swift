//
//  DetailNewsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 26.04.2021.
//

import UIKit

class DetailNewsTableViewController: UITableViewController {

    var currentNews: NewsFeed?
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
        
        let postData = currentNews!
        
        cell.selectionStyle = .none

        cell.indexPath = indexPath
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
   
        for image in 0...postData.postImages.count - 1  {
            
            cell.moreImagesView.backgroundColor = .clear
            cell.postImages?[image].tag = indexPath.row
            cell.postImages?[image].isHidden = false
            cell.postImages?[image].image = postData.postImages[image]
            //MARK: - TO DO
            cell.postImages![image].tag = image
        }
        if postData.postImages.count >= 3 {
            cell.moreImagesView.isHidden = false
        }

        cell.postImages?.forEach({$0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPhotoTapGestureRecognizer)))})
        
        return cell
    }
    
    @objc func openPhotoTapGestureRecognizer (sender: UITapGestureRecognizer) {

        cellTag = sender.view?.tag
        performSegue(withIdentifier: "ShowFullscreenNewsPhoto", sender: nil)
        print ("222")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFullscreenNewsPhoto",
           let destination = segue.destination as? FeedNewsFullscreenPhotoViewController {
            destination.photosFromNews = currentNews
            destination.photoIndexPathInt = cellTag
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
