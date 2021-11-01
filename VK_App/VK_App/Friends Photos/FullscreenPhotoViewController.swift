//
//  FullscreenPhotoViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import UIKit
import SimpleAnimation
import Kingfisher

class FullscreenPhotoViewController: UIViewController {
    
    var photoData = try? RealmService.load(typeOf: VKPhotosRealm.self).filter("ownerID == %i", (Int(Session.instance.userID)) ?? Session.instance.myID)
    @IBOutlet var currentPhoto: UIImageView!
    @IBOutlet var nextPhoto: UIImageView!
    var indexPaths: Int!
    var photoURL = ""
   

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = Presets.init().vkDarkGray
        setPhotoUrl()
        currentPhoto.kf.setImage(with: URL(string: photoURL))
        nextPhoto.isHidden = true
    }
    
    func setPhotoUrl() {
        
        guard let photos = photoData?[indexPaths] else { return }
        photoURL =  photos.photoSize2560 ??
                    photos.photoSize1280 ??
                    photos.photoSize807 ??
                    photos.photoSize604
    }
    
    @IBAction func nextPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        
        guard let photosCount = photoData?.count else { return }
        guard indexPaths >= 0 && indexPaths + 1 < photosCount else { return }
        indexPaths += 1
        
        currentPhoto.slideOut(to: .left) { _ in
            
            self.currentPhoto.kf.setImage(with: URL(string: self.photoURL))
            self.currentPhoto.transform = .identity
        }
        setPhotoUrl()
        nextPhoto.isHidden = false
        nextPhoto.kf.setImage(with: URL(string: self.photoURL))
        nextPhoto.slideIn(from: .right) { _ in

            self.nextPhoto.isHidden = true
        }
    }
    
    @IBAction func prewiousPhotoSwipe(_ sender: Any) {
        guard let photosCount = photoData?.count else { return }
        guard indexPaths < photosCount && indexPaths - 1 >= 0 else {
            return
        }
        indexPaths -= 1
        
        currentPhoto.slideOut(to: .right) { _ in
            
            self.currentPhoto.kf.setImage(with: URL(string: self.photoURL))
            self.currentPhoto.transform = .identity
        }
        setPhotoUrl()
        nextPhoto.isHidden = false
        nextPhoto.kf.setImage(with: URL(string: self.photoURL))
        nextPhoto.slideIn(from: .left) { _ in
            
            self.nextPhoto.isHidden = true
        }
    }
}
