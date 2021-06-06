//
//  FriendsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import UIKit
import Alamofire
import RealmSwift
class FriendsTableViewController: UITableViewController {
    private let networkServise = NetworkService()
    var friendsDataRealm: Results<VKUserRealm>!
    var friendsData = [VKUser] ()
    var nextData = 0
    var selectedRow: IndexPath! // IndexPath for Segue
    //MARK: - Data

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkServise.getFriends(Session.instance.myID, "", "1", "first_name,last_name,photo_200_orig,id,last_seen") { [weak self] response in

            self?.friendsData = response.response.items
            self?.tableView.reloadData()
        }
        
        tableView.backgroundColor = Presets.init().vkDarkGray
        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard !friendsData.isEmpty else { return 1 }
        return friendsData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        guard !friendsData.isEmpty else {
            cell.nameLabel.text = "Loading..."
            return cell }

        let freindsData = friendsData[indexPath.row]

        cell.nameLabel.text = "\(freindsData.firstName) \(freindsData.lastName)"
        cell.avatarImage.image = UIImage(data: try! Data(contentsOf: freindsData.avatarURL .asURL()))
        
        return cell
    }
    
    //MARK: - Segue from XIB
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
//        selectedRow = indexPath
        let id = String(friendsData[indexPath.row].userID)
        Session.instance.userID = id
        performSegue(withIdentifier: "ShowFriendPhotos", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowFriendPhotos",
//           let segueDestination = segue.destination as? FriendsPhotosCollectionViewController {
//            let selectedFriend = sortedFriends[selectedRow.section].friends[selectedRow.row]
//            segueDestination.currentFriend = selectedFriend
//
//        }
//    }
   
}


 //MARK: - Sorting friends by letters in sections


