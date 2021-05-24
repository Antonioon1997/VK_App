//
//  FriendsPhotosCollectionViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"

class FriendsPhotosCollectionViewController: UICollectionViewController {
    
    var currentFriend: FriendsData?
    var friendPhotos: [UIImage]?
    var id: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard currentFriend != nil else { return }
        id = currentFriend!.id
        
        let parameters: Parameters = [
            "owner_id" : id,
            "extended" : "1",
            "album_id" : "profile",
            "access_token" : NetworkSession.instance.token,
            "v" : "5.68"
        ]
        NetworkSession.instance.fetchData(methodForSearch: "photos.get", parameters: parameters)
        
        collectionView.backgroundColor = Presets.init().vkDarkGray
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return currentFriend?.friendPhotos.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentFriendPhotos", for: indexPath) as! FriendsPhotosCellCollectionView
    
        cell.currentFriendPhotos.image = currentFriend?.friendPhotos[indexPath.row]
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFullscreenPhoto",
           let senderCell = sender as? FriendsPhotosCellCollectionView,
           let photoCellIndexPath = collectionView.indexPath(for: senderCell),
           let segueDestination = segue.destination as? FullscreenPhotoViewController,
           let photoForFullscreen = currentFriend?.friendPhotos.compactMap({ $0 })
        {
            segueDestination.photos = photoForFullscreen
            segueDestination.photoIndexPath = photoCellIndexPath.row
            
        }
           
        
    }
}
