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
    let duration = 0.23
    let queue = 0.37

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Presets.init().vkDarkGray
        currentPhoto.image = photos[photoIndexPath]
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func nextPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        
        guard photoIndexPath >= 0 && photoIndexPath + 1 < photos.count else {
            return
        }
        
        disappearPhotoAnimation(currentPhoto, true)
        appearPhotoAnimation(nextPhoto, true)
        
    }
    
    
    @IBAction func prewiousPhotoSwipe(_ sender: Any) {
        
        guard photoIndexPath < photos.count && photoIndexPath - 1 >= 0 else {
            return
        }
        
        disappearPhotoAnimation(currentPhoto, false)
        appearPhotoAnimation(nextPhoto, false)
    }
    
    
        
    
    func appearPhotoAnimation(_ nextImageView: UIImageView,_ isMovedLeft: Bool){
        
        
        let transition = CABasicAnimation(keyPath: "position.x")
        
        if isMovedLeft {
            
            nextImageView.image = photos[photoIndexPath+1]
            
            transition.fromValue = nextImageView.layer.frame.width * 1.5 + 5
        } else {
            
            nextImageView.image = photos[photoIndexPath - 1]
            
            transition.fromValue = -(nextImageView.layer.frame.width/2) - 5
        }
        
        transition.toValue = nextImageView.layer.position.x
        transition.duration = duration
        
        nextImageView.layer.add(transition, forKey: nil)
        
        
    }
    
    func disappearPhotoAnimation(_ currentImageView: UIImageView,_ isMovedLeft: Bool){
        
        
        let transition = CABasicAnimation(keyPath: "position.x")
        transition.fromValue = currentImageView.layer.position.x
        transition.duration = duration
        
        if isMovedLeft {
            
            
            transition.toValue = -currentImageView.layer.frame.width/2
        } else {
            
            
            transition.toValue = currentImageView.layer.frame.width * 1.5
        }
        
        currentImageView.layer.add(transition, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration * 0.9) { [self] in
            if isMovedLeft{
                
                photoIndexPath += 1
            } else {
                
                photoIndexPath -= 1
            }
            currentImageView.image = photos[photoIndexPath]
        }
    }
}
