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
    private let realm = RealmService()
    var friendsData = try? RealmService.load(typeOf: VKUserRealm.self)
   
    var nextData = 0
    var indexPaths: IndexPath! // IndexPath for Segue
    //MARK: - Data

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkServise.getFriends(  Session.instance.myID,
                                    "",
                                    "1",
                                    "first_name,last_name,photo_200_orig,id,last_seen") { [weak self] response in
            guard
                let self = self,
                let data = response
            else { return }
            try? RealmService.save(items: data)
//                                     self.friendsData = data
                            
        }
        tableView.backgroundColor = Presets.init().vkDarkGray
        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendsData?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        

        guard let freinds = friendsData?[indexPath.row] else {return cell}

        cell.nameLabel.text = "\(freinds.firstName) \(freinds.lastName)"
//        cell.avatarImage.image = UIImage(data: try! Data(contentsOf: freindsData.avatarURL .asURL()))
        cell.avatarImage.kf.setImage(with: URL(string: freinds.avatarURL))
        
        return cell
    }
    
    //MARK: - Segue from XIB
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
         guard let selectedRow = friendsData?[indexPath.row] else { return }
                let id = selectedRow.id
                Session.instance.userID = String(id)
        indexPaths = indexPath
        
        self.performSegue(withIdentifier: "ShowFriendPhotos", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriendPhotos",
           let segueDestination = segue.destination as? FriendsPhotosCollectionViewController {
            guard let currentFriends = friendsData?[indexPaths.row] else { return }
            segueDestination.photoOwnersName = "\(currentFriends.firstName) \(currentFriends.lastName)"
//            segueDestination.photoOwnersName = fullName
            

        }
    }
   
}


 //MARK: - Sorting friends by letters in sections


