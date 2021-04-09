//
//  FullscreenPhotoViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import UIKit

class FullscreenPhotoViewController: UIViewController {
    
    @IBOutlet var currentPhoto: UIImageView!
    @IBOutlet var nextPhoto: UIImageView!
    
    var photos: [UIImage?] = []
    var photoIndexPath: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPhoto.image = photos[photoIndexPath]
        
    }
    
    @IBAction func nextPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        
        print ("Swiped left, indexPath = \(photoIndexPath!)")
        guard photoIndexPath >= 0 && photoIndexPath + 1 < photos.count else {
            return
        }
        photoIndexPath += 1
        currentPhoto.image = photos[photoIndexPath]
    }
    
    
    @IBAction func prewiousPhotoSwipe(_ sender: Any) {
        
        print ("Swiped right, indexPath = \(photoIndexPath!)")
        guard photoIndexPath < photos.count && photoIndexPath - 1 >= 0 else {
            return
        }
        photoIndexPath -= 1
        currentPhoto.image = photos[photoIndexPath]
    }
    
}
