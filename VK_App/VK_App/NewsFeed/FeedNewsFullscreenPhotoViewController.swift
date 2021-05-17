//
//  FeedNewsFullscreenPhotoViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 19.04.2021.
//

import UIKit

class FeedNewsFullscreenPhotoViewController: UIViewController {

    @IBOutlet weak var currentPhoto: UIImageView!
    @IBOutlet weak var nextPhoto: UIImageView!
    
   
    
    let duration = 0.4
    let queue = 0.37
    var photosFromNews: NewsFeed?
    var photoIndexPath: IndexPath!
    var photoIndexPathInt: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Presets.init().vkDarkGray
        
        currentPhoto.isUserInteractionEnabled = true

        guard photoIndexPathInt != nil else { return currentPhoto.image = photosFromNews?.postImages[0] }
        currentPhoto.image = photosFromNews?.postImages[photoIndexPathInt]
        
        
    }
    
    @IBAction func previousPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        guard photoIndexPathInt != nil && photoIndexPathInt - 1 >= 0 else { return }
        photoIndexPathInt -= 1
        addDisapperImageAnimation(currentPhoto, false)
        addAppearAnimation(nextPhoto, false)
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + queue) { [self] in
            
            currentPhoto.image = photosFromNews?.postImages[photoIndexPathInt]
        }
        

        
    }
    
    @IBAction func nextPhotoSwipe(_ sender: UISwipeGestureRecognizer) {
        print ("2")
        guard photoIndexPathInt != nil && photoIndexPathInt + 1 < (photosFromNews?.postImages.count)! else { return }

        photoIndexPathInt += 1
        addDisapperImageAnimation(currentPhoto,  true)
        addAppearAnimation(nextPhoto, true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + queue) { [self] in
            
            currentPhoto.image = photosFromNews?.postImages[photoIndexPathInt]
        }
    }
    
    
    func addDisapperImageAnimation (_ currentUIView: UIImageView, _ isMovedLeft: Bool ) {
    
        let fromValue: CGFloat
        let toValue: CGFloat
        
        if isMovedLeft == true {
            fromValue = self.view.layer.position.x
            toValue = -(self.view.layer.position.x * 1.2)
        } else {
            fromValue = self.view.layer.position.x
            toValue = self.view.layer.position.x * 2
        }
        let transitionAnimation = CABasicAnimation(keyPath: "position.x")
        transitionAnimation.fromValue = fromValue
        transitionAnimation.toValue = toValue
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 0
        
        
        let groupedAnimations = CAAnimationGroup()
        groupedAnimations.animations = [transitionAnimation, scaleAnimation]
        groupedAnimations.duration = duration
       
        
        currentUIView.layer.add(groupedAnimations, forKey: nil)
        currentUIView.image = photosFromNews?.postImages[photoIndexPathInt]
    }
    
    func addAppearAnimation (_ nextImageView: UIImageView,_ isMovedLeft: Bool) {
      
        let fromValue: CGFloat
        let toValue: CGFloat
        
        if isMovedLeft == true {
            fromValue = self.view.layer.position.x * 1.2
            toValue = self.view.layer.position.x
        } else {
            fromValue = -(self.view.layer.position.x * 1.2)
            toValue = self.view.layer.position.x
        }
        let transitionAnimation = CABasicAnimation(keyPath: "position.x")
        transitionAnimation.fromValue = fromValue
        transitionAnimation.toValue = toValue
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        
        
        let groupedAnimations = CAAnimationGroup()
        groupedAnimations.animations = [transitionAnimation, scaleAnimation]
        groupedAnimations.duration = duration
       
        
        nextImageView.layer.add(groupedAnimations, forKey: nil)
        nextImageView.image = photosFromNews?.postImages[photoIndexPathInt]
    }
}
