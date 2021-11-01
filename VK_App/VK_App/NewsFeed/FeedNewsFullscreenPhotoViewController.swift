//
//  FeedNewsFullscreenPhotoViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 19.04.2021.
//

import UIKit
import Kingfisher
import SimpleAnimation

class FeedNewsFullscreenPhotoViewController: UIViewController {

    @IBOutlet weak var currentPhoto: UIImageView!
    @IBOutlet weak var nextPhoto: UIImageView!
    
    let animationDuration = 0.4
    let animationQueueTime = 0.37
    var photos2 = [Attachments]()
    var photoIndexPathInt: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Presets.init().vkDarkGray
        
        currentPhoto.isUserInteractionEnabled = true

        guard     photoIndexPathInt != nil,
                  let photo = photos2[photoIndexPathInt].photo?.sizes.last?.url
            else { return  }
        currentPhoto.kf.setImage(with: URL(string: photo))
    }
    
    @IBAction func previousPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        guard photoIndexPathInt != nil && photoIndexPathInt - 1 >= 0 else { return }
        photoIndexPathInt -= 1
      guard let photo = self.photos2[photoIndexPathInt].photo?.sizes.last?.url
        else {
        return }
        currentPhoto.slideOut(to: .right) { _ in
            self.currentPhoto.transform = .identity
            self.currentPhoto.kf .setImage(with: URL(string:
           photo))
        }
        nextPhoto.kf.setImage(with: URL(string: photo))
        nextPhoto.isHidden = false
        nextPhoto.slideIn(from: .left) { _ in
            self.nextPhoto.isHidden = true
            self.nextPhoto.transform = .identity
        }
    }
    
    @IBAction func nextPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        
        guard
              
              photoIndexPathInt != nil && ((photoIndexPathInt + 1) < (photos2.count))
        else {  return }
                
        photoIndexPathInt += 1
        guard let photo = self.photos2[photoIndexPathInt].photo?.sizes.last?.url
        
        else {
            return }
        currentPhoto.slideOut(to: .left) { _ in
            self.currentPhoto.transform = .identity
            self.currentPhoto.kf .setImage(with: URL(string:
           photo))
        }
        nextPhoto.kf.setImage(with: URL(string: photo))
        nextPhoto.isHidden = false
        nextPhoto.slideIn(from: .right) { _ in
            self.nextPhoto.isHidden = true
            self.nextPhoto.transform = .identity
        }
    }
}
