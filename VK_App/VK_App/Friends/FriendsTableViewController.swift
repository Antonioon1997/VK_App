//
//  FriendsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import UIKit
import Alamofire
import RealmSwift
class FriendsTableViewController: UITableViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var searchBarButtom: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchBarIsActive: Bool = false
    
    private let networkServise = NetworkService()
    private let realm = RealmService()
    var friendsData = try? RealmService.load(typeOf: VKUserRealm.self)
    
    var nextData = 0
    var indexPaths: IndexPath! // IndexPath for Segue
    var token: NotificationToken?
    var searchedFriends: Results<VKUserRealm>?
    var friends: VKUserRealm!
    // MARK: - Data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Arial", size: 20)!]
        
        searchBar.backgroundColor = .clear
        searchBar.searchTextField.backgroundColor = Presets.init().vkLightGray
        searchBar.placeholder = "Поиск"
        searchBar.delegate = self
        searchBarButtom.image = UIImage(systemName: "magnifyingglass")
        self.tabBarController?.delegate = self
        
        navigationController?.navigationBar.barTintColor = .clear
        networkServise.getFriends(  Session.instance.myID,
                                    "",
                                    "1",
                                    "first_name,last_name,photo_200_orig,id,last_seen, online") { [weak self] response in
            guard
                let self = self,
                let data = response
            else { return }
            try? RealmService.save(items: data)
            self.observeRealm()
            self.friendsData = try? RealmService.load(typeOf: VKUserRealm.self)
        }
        tableView.backgroundColor = Presets.init().vkDarkGray
        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !searchBarIsActive {
            return friendsData?.count ?? 0
        } else {
            return searchedFriends?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        //        guard let friends = friendsData?[indexPath.row] else {return cell}
        if !searchBarIsActive {
            friends = (friendsData?[indexPath.row])
        } else {
            friends = searchedFriends?[indexPath.row]
        }
        
        cell.nameLabel.text = "\(friends.firstName) \(friends.lastName)"
        cell.avatarImage.kf.setImage(with: URL(string: friends.avatarURL))
        guard friends.isOnline == 1 else { return cell }
        cell.isOnlineView.backgroundColor = Presets.init().onlineViewColor
        
        return cell
    }
    
    // MARK: - Segue from XIB
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectedRow = friendsData?[indexPath.row] else { return }
        let id = selectedRow.id
        Session.instance.userID = String(id)
        indexPaths = indexPath
        
        self.performSegue(withIdentifier: "ShowFriendScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriendPhotos",
           let segueDestination = segue.destination as? FriendsPhotosCollectionViewController {
            guard let currentFriends = friendsData?[indexPaths.row] else { return }
            segueDestination.photoOwnersName = "\(currentFriends.firstName) \(currentFriends.lastName)"
            //            segueDestination.photoOwnersName = fullName
        } else if segue.identifier == "ShowFriendScreen",
                let segueDestination = segue.destination as? FriendScreenTableViewController {
            guard let friendID = friendsData?[indexPaths.row].id else { return }
            segueDestination.userID = friendID
        }
    }
    
    @IBAction func activateSearchBar(_ sender: Any) {
        
        searchBarIsActive.toggle()
        
        if searchBarIsActive {
            navigationItem.titleView = searchBar
            searchBar.popIn()
            searchBarButtom.image = UIImage(systemName: "xmark")
        } else {
            
            searchBar.popOut { _ in
                self.navigationItem.titleView?.isHidden = true
                self.searchBarButtom.image = UIImage(systemName: "magnifyingglass")
            }
        }
    }
    
    private func observeRealm() {
        token = friendsData?.observe({ changes in
            switch changes {
            case .initial(let results):
                if results.count > 0 {
                    self.tableView.reloadData()
                }
                
            case let .update(results, deletions, insertions, modifications):
                print(results, deletions, insertions, modifications)
                
            case .error(let error):
                print(error)
            }
        })
    }}

// MARK: - Sorting friends by letters in sections

extension FriendsTableViewController: UISearchBarDelegate, UITabBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            searchBarIsActive = true
            searchedFriends = friendsData?.filter("firstName CONTAINS[cd] '\(searchText)' OR lastName CONTAINS[cd] '\(searchText)'")
            
            //        print(searchedFriends)
            tableView.reloadData()
        } else {
            searchBarIsActive = false
            tableView.reloadData()
        }
        
    }
    
}
