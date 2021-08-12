//
//  ProfileTableCell.swift
//  VK_App
//
//  Created by Антон Онищенко on 30.07.2021.
//

import UIKit

class ProfileHeadTableCell: UITableViewCell {
    
    @IBOutlet var userAvatarImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userStatusLabel: UILabel?
    @IBOutlet var isOnlineLabel: UILabel!
    @IBOutlet var messageButton: UIButton!
    @IBOutlet var callButton: UIButton!
    @IBOutlet var isFriendsButton: UIButton!
    @IBOutlet var sendMoneyButton: UIButton!
    @IBOutlet var sendGiftButton: UIButton!
    @IBOutlet var setNotificationsButton: UIButton!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var occupationImageView: UIImageView!
    @IBOutlet var occupationLabel: UILabel!
    @IBOutlet var subscribersImageView: UIImageView!
    @IBOutlet var subscribersLabel: UILabel!
    @IBOutlet var additionalInfoImageView: UIImageView!
    @IBOutlet var additionalInfoLabel: UILabel!

    
    @IBOutlet var cityStackView: UIStackView!
    @IBOutlet var occupationStackView: UIStackView!
    @IBOutlet var subscribersStackView: UIStackView!
    @IBOutlet var additionalStackView: UIStackView!

    
    let presets = Presets()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
        
        self.backgroundColor = Presets.init().vkDarkGray
        
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.layer.bounds.height/2
        userAvatarImageView.clipsToBounds = true
        
        userNameLabel.tintColor = presets.profileNameTitleColor
        
        messageButton.backgroundColor = presets.vkButtonsBackgroundColor
        messageButton.setTitle("Сообщение", for: .normal)
        messageButton.setTitleColor(presets.vkDarkGray, for: .normal)
        messageButton.layer.cornerRadius = 8
        
        callButton.backgroundColor = presets.vkButtonsBackgroundColor
        callButton.setTitle("Звонок", for: .normal)
        callButton.setTitleColor(presets.vkDarkGray, for: .normal)
        callButton.layer.cornerRadius = 8
        
        setTextColorAndFont([userNameLabel], [userStatusLabel], [isOnlineLabel, occupationLabel, subscribersLabel, cityLabel], [])
        
        //MARK:  - TODO Ебаные кнопки хуй знает как сделать нормальный инсет
        isFriendsButton.setImage(UIImage(named: "В друзьях"), for: .normal)
        sendMoneyButton.setImage(UIImage(named: "Деньги"), for: .normal)
        sendGiftButton.setImage(UIImage(named: "Подарок"), for: .normal)
        setNotificationsButton.setImage(UIImage(named: "Уведомления"), for: .normal)

//        cityLabel.textColor = presets.occupationTitleColor
        
        occupationImageView.tintColor = presets.occupationTitleColor
        
        subscribersImageView.image = UIImage(named: "Subs")
        subscribersImageView.tintColor = .lightGray
        
        additionalInfoImageView.image = UIImage(systemName: "info.circle.fill")
        additionalInfoImageView.tintColor = .white
        
        additionalInfoLabel.font = presets.standartLabelFont
        additionalInfoLabel.textColor = presets.profileNameTitleColor
        additionalInfoLabel.text = "Подробная информация"
        
    }
    
    func setTable(_ occupationType: String,_ occupationText: String,_ subscribers: Int,_ city: String?) {
        
        switch occupationType {
        case "university", "school":
            occupationStackView.isHidden = false
            occupationImageView.image = UIImage(named: "StudenHat")
            occupationLabel.text = "Образование: \(occupationText)"
        case "work":
            occupationStackView.isHidden = false
            occupationImageView.image = UIImage(named: "Work")
            occupationLabel.text = "Место работы: \(occupationText)"
//            case "school"
        case "":
            return
        default:
            occupationStackView.isHidden = false
            occupationLabel.text = "Новый вид занятия: \(occupationType)"
        }
        if subscribers > 0 {
            subscribersStackView.isHidden = false
            switch subscribers % 10 {
            case 1:
                    subscribersLabel.text = "\(subscribers) подписчик"
            case 2, 3, 4:
                    subscribersLabel.text = "\(subscribers) подписчика"
            default:
                subscribersLabel.text = "\(subscribers) подписчиков"
            }
        }
        if city != "" && city != nil,
           let cityTitle = city {
            cityStackView.isHidden = false
            cityImageView.image = UIImage(named: "City")
            cityLabel.text = "Город: \(cityTitle)"
        }
        
        
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTextColorAndFont(_ nameLabel: [UILabel], _ occupationLabel: [UILabel?], _ isOnlineLabel: [UILabel], _ otherLabel: [UILabel]) {
        
        nameLabel.forEach({$0.textColor = presets.profileNameTitleColor; $0.font = presets.nameLabelFont})
        occupationLabel.forEach({$0?.textColor = presets.occupationTitleColor; $0?.font = presets.occupationLabelFont})
        isOnlineLabel.forEach({$0.textColor = presets.isOnlineTitleColor; $0.font = presets.occupationLabelFont})
        
    }
    
    override func prepareForReuse() {
        
        cityStackView.isHidden = true
        occupationStackView.isHidden = true
        subscribersStackView.isHidden = true
        
    }
    
    
}


