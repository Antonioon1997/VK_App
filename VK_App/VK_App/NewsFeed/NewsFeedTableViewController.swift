//
//  NewsFeedTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.04.2021.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {
    
    var newsPosts = [
        NewsFeed(authorName: "Шронк", authorDescription: "Не держи в себе", authorAvatar: UIImage(named: "Шрек"), postText: "Somebody once told me", postImages: [UIImage(named: "Шрек"),UIImage(named: "Шрек_2"),UIImage(named: "Шрек_3"),UIImage(named: "Шрек_4"), UIImage(named: "Шрек")]),
        NewsFeed(authorName: "Осёл", authorDescription: "Ебу драконов", authorAvatar: UIImage(named: "Осёл"), postText: nil, postImages: [UIImage(named: "Осёл"), UIImage(named: "Дети осла")])
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        
        self.tableView.register(UINib(nibName: "FooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "FooterView")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsPosts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell

        let postData = newsPosts[indexPath.row]
        
        cell.avatarImage.image = postData.authorAvatar
        cell.nameLabel.text = postData.authorName
        cell.descriptionLabel.text = postData.authorDescription
        cell.postLabel?.text = postData.postText
        
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
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterView") as! FooterView
        
        footer.likeImageView.image = UIImage(named: "Шрек")
        footer.likeCountLabel.text = "12"
        
        return footer
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
