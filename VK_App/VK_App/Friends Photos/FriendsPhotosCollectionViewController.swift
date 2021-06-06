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
    var photoData = [VKPhoto] ()
    private let networkService = NetworkService()
    var id: String = ""
    var photos = [String] ()
    var indexPathInt = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getPhotos(Session.instance.userID, "profile", "", "0", "1", "", "", "0", "", "100") { [weak self] response in
            self?.photoData = response.response.items
            
            self?.collectionView.reloadData()
        }
        
        collectionView.backgroundColor = Presets.init().vkDarkGray

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard !photoData.isEmpty else {return 0}
        return photoData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentFriendPhotos", for: indexPath) as! FriendsPhotosCellCollectionView
        guard !photoData.isEmpty else {
            
            return cell
        }
        let data = photoData[indexPath.row]
       
       var photo = ""
      
        if data.photoSize2560 != nil {
            photo = data.photoSize2560!
            photos.append(data.photoSize2560!) }
        else if data.photoSize1280 != nil {
            photo = data.photoSize1280!
            photos.append(data.photoSize1280!) }
        else if data.photoSize807 != nil {
            photo = data.photoSize807!
            photos.append(data.photoSize807!) }
        else { photo = data.photoSize604
            photos.append(data.photoSize604) }
        
        cell.currentFriendPhotos.image = UIImage(data:  try! Data(contentsOf: photo.asURL()))

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexPathInt = indexPath.row
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFullscreenPhoto",
           let senderCell = sender as? FriendsPhotosCellCollectionView,
           let photoCellIndexPath = collectionView.indexPath(for: senderCell),
           let segueDestination = segue.destination as? FullscreenPhotoViewController
        {
            segueDestination.photos = photos
            segueDestination.photoIndexPath = photoCellIndexPath.row
            
        }
    }
}
