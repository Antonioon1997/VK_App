//
//  FriendScreenTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 30.07.2021.
//

import UIKit
import RealmSwift

class FriendScreenTableViewController: UITableViewController {
    
    var token: NotificationToken?
    var pronoun = ""
    let presets = Presets()
    var user: VKUser?
    var userRealm: Results<VKUserProfileRealm>?
    var userID: Int!
    var userFriends: [VKUsersFriendsItems]?
//    var usersPhotos: [VKUsersPhotosItems]?
    var mutualFriends: [Int]?
    private let realm = RealmService()
    let responseGroup = DispatchGroup()
    var wall: Response?
    var userPhotos = try? RealmService.load(typeOf: VKAllPhotosRealm.self).filter("ownerID == %i", (Int(Session.instance.userID)) ?? 0)
    
//    var token: NotificationToken?
    
    let networkService = NetworkService()
    let netSer = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "ProfileHeadTableCell", bundle: nil), forCellReuseIdentifier: "ProfileHeadTableCell")
        self.tableView.register(UINib(nibName: "FriendsScrollCollectionTableCellTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendsScrollCollectionTableCellTableViewCell")
        self.tableView.register(UINib(nibName: "ProfilePhotosPrewievTableCell", bundle: nil), forCellReuseIdentifier: "ProfilePhotosPrewievTableCell")
        self.tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        
        
        
//        networkService.getUsersPhotos(userID, "profile", "", "1", "", "", "", "", "", "100") { [weak self] response in
//
//            guard let photos = response else {return}
//            self?.usersPhotos = photos
//        }
//        networkService.getAllPhotosRealm(userID, "0", "", "200", "0", "0", "0", "1") { [weak self] response in
//            print(response)
//        }
        networkService.getAllPhotosRealm(userID, "", "", "0", "0", "1") { [weak self] response in
            try? RealmService.save(items: response)
            self?.observeRealm()
            self?.tableView.reloadData()
            
        }

        networkService.getUserRealm(userID) { [weak self] response in
            guard
                let self = self
            else { return }
            try? RealmService.save(items: response)
            
            self.observeRealm()
            self.userRealm = try? RealmService.load(typeOf: VKUserProfileRealm.self).filter("id == %i", (Int(Session.instance.userID)) ?? 0)
            self.tableView.reloadData()

        }
        
        networkService.getMutualFriends(Session.instance.myID, userID, "", "", 1000, "") { [weak self] response in
            guard let mutualFriendsResp = response.response else { return }
            self?.mutualFriends = mutualFriendsResp
    }
        networkService.getUsersFriends(userID, "", "", "500", "nickname, domain, sex, photo_50, photo_100, photo_200_orig, online", "nom", "") { [weak self] response in
            self?.userFriends = response

            self!.tableView.reloadData()
        }
        networkService.getWall(userID) { [weak self] response in
            self?.wall = response
        }
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0...2:
            return 1
        default:
            return 5
        }
//        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headCell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeadTableCell", for: indexPath) as! ProfileHeadTableCell
        let friendsScrollCell = tableView.dequeueReusableCell(withIdentifier: "FriendsScrollCollectionTableCellTableViewCell", for: indexPath) as! FriendsScrollCollectionTableCellTableViewCell
        let photoPreviewCell = tableView.dequeueReusableCell(withIdentifier: "ProfilePhotosPrewievTableCell", for: indexPath) as! ProfilePhotosPrewievTableCell
//
        let wallCell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell
        
        if indexPath.section == 0 {
        
        guard let userHeadInfo = userRealm?.first else { return headCell }
        headCell.userAvatarImageView.kf.setImage(with: URL(string: userHeadInfo.photo400Orig ?? userHeadInfo.photo200Orig ?? userHeadInfo.photo200 ?? userHeadInfo.photo100 ?? ""))
            headCell.userNameLabel.text = "\(userHeadInfo.firstName) \(userHeadInfo.lastName)"
        headCell.userStatusLabel?.text = userHeadInfo.status ?? ""
        headCell.setTable(userHeadInfo.occupationType ?? "", userHeadInfo.occupationName ?? "", userHeadInfo.followersCount, userHeadInfo.cityTitle)
        if userHeadInfo.isOnline == 0 {
            if userHeadInfo.sex == 2 {
                pronoun = "Был "
            }
            else  {
                pronoun = "Была "
            }
            headCell.isOnlineLabel.text = pronoun + presets.setDateFormat(userHeadInfo.lastSeen).lowercased()
        } else { headCell.isOnlineLabel.text = "В сети" }
        headCell.userStatusLabel?.text = userHeadInfo.status
        setTitle(userHeadInfo.domain)
        
        return headCell
            
            
    }
        else if indexPath.section == 1 {
            
            guard let friends = userFriends else {return friendsScrollCell}
            friendsScrollCell.friends = friends
            friendsScrollCell.friendsCollectionView.reloadData()
            var friendsCountText = "\(friends.count)"
            if let mutualFriendsCount = mutualFriends?.count {
                friendsCountText = "\(friends.count) · \(mutualFriendsCount) общих"
            }
            friendsScrollCell.friendsCountLabel.text = friendsCountText
            
            return friendsScrollCell
        }
        else if indexPath.section == 2 {
        
        guard let photos = userPhotos else {return photoPreviewCell}
                if photos.count < 6 {
                for photo in 0..<photos.count {
//                    guard let currentPhoto = photos[photo].url else {return photoPreviewCell}
                    photoPreviewCell.photosImageViews?[photo].kf.setImage(with: URL(string: photos[photo].url))
                    }
                } else {
                    for photo in 0...5 {
//                        guard let currentPhoto = photos[photo].url else {return photoPreviewCell}
                        photoPreviewCell.photosImageViews?[photo].kf.setImage(with: URL(string: photos[photo].url))
                        }
                }
        photoPreviewCell.photosCountLabel.text = "\(photos.count)"
        
        return photoPreviewCell
        }
        wallCell.setOneUserAuthor(userRealm?.first)
        wallCell.setWall(wall?.items?[indexPath.row], wall?.items?[indexPath.row].attachments)
        return wallCell
    }

    private func observeRealm() {
        token = userPhotos?.observe({ changes in
            switch changes {
            case .initial(let results):
                if results.count > 0 {
                    self.tableView.reloadData()
                }
                
            case let .update(results, deletions, insertions, modifications):
                print(results, deletions, insertions, modifications)
//                self.collectionView.reloadData()
                
            case .error(let error):
                print(error)
            }
        })
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
    func setTitle(_ domain: String?) {
        guard let title = domain else {return}
        self.navigationItem.title = title
    }
    

}
