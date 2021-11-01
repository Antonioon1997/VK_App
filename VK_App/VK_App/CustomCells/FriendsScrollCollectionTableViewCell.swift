//
//  FriendsScrollCollectionTableCellTableViewCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 03.08.2021.
//

import UIKit

class FriendsScrollCollectionTableViewCell: UITableViewCell {
    
    @IBOutlet var friendsLabel: UILabel!
    @IBOutlet var friendsCountLabel: UILabel!
    @IBOutlet var friendsCollectionView: UICollectionView!
    
    var friends = [VKUsersFriendsItems]()
    let preset = Presets()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.friendsCollectionView.register(UINib(nibName: "ProfileFriendsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ProfileFriendsCollectionCell")
        self.backgroundColor = Presets.init().vkDarkGray
        self.friendsCollectionView.dataSource = self
        self.friendsCollectionView.delegate = self
        self.friendsCollectionView.backgroundColor = .clear
        
        friendsLabel.text = "ДРУЗЬЯ"
        friendsLabel.font = preset.standartLabelFont
        friendsLabel.textColor = preset.profileNameTitleColor
        friendsCountLabel.font = preset.standartLabelFont
        friendsCountLabel.textColor = preset.cellsCountsTitleColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension FriendsScrollCollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard !friends.isEmpty else {return 0 }
        return friends.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileFriendsCollectionCell", for: indexPath) as! ProfileFriendsCollectionCell
        guard let friendPhoto = friends[indexPath.row].photo100,
              let firstName = friends[indexPath.row].firstName,
              let lastName = friends[indexPath.row].lastName
        else { return cell }
        
        cell.friendAvatar?.kf.setImage(with: URL(string: friendPhoto))
        cell.frindName.text = "\(firstName) \n \(lastName)"
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
    
}
