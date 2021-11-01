//
//  TableViewCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 29.10.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var photos: [Attachments]?
    var photoNumber: Int = 0

    var firstImageView: UIImageView  = {
        let firstImage = UIImageView()
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        
        return firstImage
    }()
    var secondImageView: UIImageView  = {
        let secondImage = UIImageView()
        secondImage.translatesAutoresizingMaskIntoConstraints = false
        
        return secondImage
    }()
    
    let pageConroller: UIPageControl = {
        let pageController = UIPageControl()
        pageController.backgroundColor = .clear
        pageController.currentPageIndicatorTintColor = .black
        return pageController
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(nextPhotoSwipe))
        leftSwipe.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(prewiousPhotoSwipe))
        rightSwipe.direction = .right
        
        self.addSubview(secondImageView)
        self.addSubview(firstImageView)
        
        setConstraints(firstImageView)
        firstImageView.isUserInteractionEnabled = true
        firstImageView.addGestureRecognizer(leftSwipe)
        firstImageView.addGestureRecognizer(rightSwipe)
        firstImageView.contentMode = .scaleAspectFit
        firstImageView.backgroundColor = Presets.init().vkDarkGray
        secondImageView.backgroundColor = Presets.init().vkDarkGray
        
        setConstraints(secondImageView)
        
        secondImageView.contentMode = .scaleAspectFit
        
        self.addSubview(pageConroller)
        
        pageConroller.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        pageConroller.bottomAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 20).isActive = true
        pageConroller.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pageConroller.currentPageIndicatorTintColor = .red
        pageConroller.currentPage = 0
        pageConroller.numberOfPages = photos?.count ?? 0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setConstraints (_ imageView: UIImageView) {
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    @objc func nextPhotoSwipe(_ recognize: UISwipeGestureRecognizer) {
        
        guard let photosCount = photos?.count else {
            print("Stopped")
            return }
        
        guard photoNumber >= 0 && photoNumber + 1 < photosCount else { return }
        photoNumber += 1
        print("Worked")
        
        firstImageView.slideOut(to: .left) { _ in
            
            self.firstImageView.kf.setImage(with: URL(string: self.photos?[self.photoNumber].photo?.sizes.last?.url ?? ""))
            self.firstImageView.transform = .identity
        }
        secondImageView.isHidden = false
        secondImageView.kf.setImage(with: URL(string: self.photos?[photoNumber].photo?.sizes.last?.url ?? ""))
        secondImageView.slideIn(from: .right) { _ in

            self.secondImageView.isHidden = true
        }
    }
    
    @objc func prewiousPhotoSwipe(_ sender: Any) {
        guard let photosCount = photos?.count else { return }
        guard photoNumber < photosCount && photoNumber - 1 >= 0 else {
            return
        }
        photoNumber -= 1
        
        firstImageView.slideOut(to: .right) { _ in
            
            self.firstImageView.kf.setImage(with: URL(string: self.photos?[self.photoNumber].photo?.sizes.last?.url ?? ""))
            self.firstImageView.transform = .identity
        }
        
        secondImageView.isHidden = false
        secondImageView.kf.setImage(with: URL(string: self.photos?[self.photoNumber].photo?.sizes.last?.url ?? ""))
        secondImageView.slideIn(from: .left) { _ in
            
            self.secondImageView.isHidden = true
        }
    }
}
