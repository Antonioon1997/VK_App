//
//  FriendsPhotosCollectionViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import UIKit
import Alamofire
import RealmSwift
import Kingfisher

private let reuseIdentifier = "Cell"

class FriendsPhotosCollectionViewController: UICollectionViewController {
    
    var photoData = try? RealmService.load(typeOf: VKPhotosRealm.self).filter("ownerID == %i", (Int(Session.instance.userID)) ?? 0)
    
    private let networkService = NetworkService()
    var indexPaths: IndexPath!
    var photoOwnersName: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getPhotos(Session.instance.userID, "profile", "", "0", "1", "", "", "0", "", "100") { [weak self] response in
            guard let photos = response else { return }
            try? RealmService.save(items: photos)
            
            self?.collectionView.reloadData()
        }
        self.title = photoOwnersName
        
        collectionView.backgroundColor = Presets.init().vkDarkGray

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        
        return photoData?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentFriendPhotos", for: indexPath) as! FriendsPhotosCellCollectionView
        
        guard let photo = photoData?[indexPath.row].photoSize604 ??
                          photoData?[indexPath.row].photoSize130
                          else { return cell }
        
        cell.currentFriendPhotos.kf.setImage(with: URL(string: photo))
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFullscreenPhoto",
           let senderCell = sender as? FriendsPhotosCellCollectionView,
           let photoCellIndexPath = collectionView.indexPath(for: senderCell),
           let segueDestination = segue.destination as? FullscreenPhotoViewController
        {
            segueDestination.indexPaths = photoCellIndexPath.row
            
        }
    }
}
