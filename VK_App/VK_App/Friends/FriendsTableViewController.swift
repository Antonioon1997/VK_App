//
//  FriendsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var selectedRow: IndexPath! // IndexPath for Segue
    //MARK: - Data
    
    
    var firstLetters = [String] ()
    var sortedFriends = [SortedFriends] ()
    
    var friends = [
        FriendsData(name: "Сергей Герман", city: "Москва", avatar: UIImage(named: "Сергей Герман")!, friendPhotos: [UIImage(named: "Сергей Герман"), UIImage(named: "Сергей Герман_2"), UIImage(named: "Сергей Герман_3")]),
        FriendsData(name: "Елизавета Анищенко", city: "Москва", avatar: UIImage(named: "Елизавета Анищенко")!, friendPhotos: [UIImage(named: "Елизавета Анищенко"), UIImage(named: "Елизавета Анищенко_2"), UIImage(named: "Елизавета Анищенко_3")]),
        FriendsData(name: "Елена Манаенкова", city: "Москва", avatar: UIImage(named: "Елена Манаенкова")!, friendPhotos: [UIImage(named: "Елена Манаенкова"), UIImage(named: "Елена Манаенкова_2"), UIImage(named: "Елена Манаенкова_3")]),
        FriendsData(name: "Дмитрий Сиюткин", city: "Москва", avatar: UIImage(named: "Дмитрий Сиюткин")!, friendPhotos: [UIImage(named: "Дмитрий Сиюткин"), UIImage(named: "Дмитрий Сиюткин"), UIImage(named: "Дмитрий Сиюткин_3")]),
        FriendsData(name: "Дмитрий Степанов", city: "Феодосия", avatar: UIImage(named: "Дмитрий Степанов")!, friendPhotos: [UIImage(named: "Дмитрий Степанов"), UIImage(named: "Дмитрий Степанов_2"), UIImage(named: "Дмитрий Степанов_3")]),
        FriendsData(name: "Александр Онищенко", city: "Голицино", avatar: UIImage(named: "Александр Онищенко")!, friendPhotos: [UIImage(named: "Александр Онищенко_2"), UIImage(named: "Александр Онищенко"), UIImage(named: "Александр Онищенко_3")]),
        FriendsData(name: "Анастасия Онищенко", city: "Голицино", avatar: UIImage(named: "Анастасия Онищенко")!, friendPhotos: [UIImage(named: "Анастасия Онищенко_2"), UIImage(named: "Анастасия Онищенко"), UIImage(named: "Анастасия Онищенко_3")]),
        FriendsData(name: "Валентин Чуканов", city: "Москва", avatar: UIImage(named: "Валентин Чуканов")!, friendPhotos: [UIImage(named: "Валентин Чуканов"), UIImage(named: "Валентин Чуканов_2"), UIImage(named: "Валентин Чуканов_3")]),
        FriendsData(name: "Наталия Гончарова", city: "Москва", avatar: UIImage(named: "Наталия Гончарова")!, friendPhotos: [UIImage(named: "Наталия Гончарова")]),
        FriendsData(name: "Валерия Попова", city: "Санкт-Петербург", avatar: UIImage(named: "Валерия Попова")!, friendPhotos: [UIImage(named: "Валерия Попова"), UIImage(named: "Валерия Попова_2"), UIImage(named: "Валерия Попова_3")]),
        FriendsData(name: "Татьяна Шмакова", city: "Одинцово", avatar: UIImage(named: "Татьяна Шмакова")!, friendPhotos: [UIImage(named: "Татьяна Шмакова"), UIImage(named: "Татьяна Шмакова_2"), UIImage(named: "Татьяна Шмакова_3")]),
        FriendsData(name: "Рустам Мухамеджанов", city: "Москва", avatar: UIImage(named: "Рустам Мухамеджанов")!, friendPhotos: [UIImage(named: "Рустам Мухамеджанов"), UIImage(named: "Рустам Мухамеджанов_2"), UIImage(named: "Рустам Мухамеджанов_3")]),
        FriendsData(name: "Диана Мельничук", city: "Симферополь", avatar: UIImage(named: "Диана Мельничук")!, friendPhotos: [UIImage(named: "Диана Мельничук"), UIImage(named: "Диана Мельничук_2"), UIImage(named: "Диана Мельничук_3")]),
        FriendsData(name: "Диана Гончарова", city: "Джанкой", avatar: UIImage(named: "Диана Гончарова")!, friendPhotos: [UIImage(named: "Диана Гончарова"), UIImage(named: "Диана Гончарова_2"), UIImage(named: "Диана Гончарова_3")]),
        FriendsData(name: "Рина Зыкова", city: "Тюмень", avatar: UIImage(named: "Рина Зыкова")!, friendPhotos: [UIImage(named: "Рина Зыкова"), UIImage(named: "Рина Зыкова_2"), UIImage(named: "Рина Зыкова_3")]),
        FriendsData(name: "Камилла Руссакова", city: "Минск", avatar: UIImage(named: "Камилла Руссакова")!, friendPhotos: [UIImage(named: "Камилла Руссакова"), UIImage(named: "Камилла Руссакова_2"), UIImage(named: "Камилла Руссакова_3")]),
        FriendsData(name: "Андрей Романюк", city: "Яркое", avatar: UIImage(named: "Андрей Романюк")!, friendPhotos: [UIImage(named: "Андрей Романюк"), UIImage(named: "Андрей Романюк_2"), UIImage(named: "Андрей Романюк_3")]),
        FriendsData(name: "Яна Капинус", city: "Калуга", avatar: UIImage(named: "Яна Капинус")!, friendPhotos: [UIImage(named: "Яна Капинус"), UIImage(named: "Яна Капинус_2"), UIImage(named: "Яна Капинус_3")]),
        FriendsData(name: "Евгений Загоненко", city: "Феодосия", avatar: UIImage(named: "Евгений Загоненко")!, friendPhotos: [UIImage(named: "Евгений Загоненко"), UIImage(named: "Евгений Загоненко_2"), UIImage(named: "Евгений Загоненко_3")]),
        FriendsData(name: "Светлана Коршак", city: "Кировск", avatar: UIImage(named: "Светлана Коршак")!, friendPhotos: [UIImage(named: "Светлана Коршак"), UIImage(named: "Светлана Коршак_2"), UIImage(named: "Светлана Коршак_3")]),
        FriendsData(name: "Богдан Герасимович", city: "Симферополь", avatar: UIImage(named: "Богдан Герасимович")!, friendPhotos: [UIImage(named: "Богдан Герасимович"), UIImage(named: "Богдан Герасимович_2"), UIImage(named: "Богдан Герасимович_3")]),
        FriendsData(name: "Михаил Харламов", city: "Одинцово", avatar: UIImage(named: "Михаил Харламов")!, friendPhotos: [UIImage(named: "Михаил Харламов"), UIImage(named: "Михаил Харламов_2"), UIImage(named: "Михаил Харламов_3")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = Presets.init().vkDarkGray
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        getFirstLetter()
        sortFriendsByFirstLetter()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return firstLetters.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sortedFriends[section].friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let friend = sortedFriends[indexPath.section].friends

        cell.nameLabel.text = friend[indexPath.row].name
        cell.descriptionLabel.text = friend[indexPath.row].city
        cell.avatarImage.image = friend[indexPath.row].avatar
        
        return cell
    }
    
    //MARK: - Segue from XIB
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        selectedRow = indexPath
        performSegue(withIdentifier: "ShowFriendPhotos", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriendPhotos",
           let segueDestination = segue.destination as? FriendsPhotosCollectionViewController {
            let selectedFriend = sortedFriends[selectedRow.section].friends[selectedRow.row]
            segueDestination.currentFriend = selectedFriend
            
        }
    }
}


 //MARK: - Sorting friends by letters in sections
extension FriendsTableViewController {
    
    func getFirstLetter () {
        let letters = Set(friends.map({$0.name.first!}))
        letters.forEach { (Character) in
            firstLetters.append("\(Character)")
        }
        firstLetters = firstLetters.sorted(by: <)
        print (firstLetters)
    }
    
    func sortFriendsByFirstLetter() {
        
    let groupedFriends = Dictionary.init(grouping: friends) {String($0.name.prefix(1))}
        sortedFriends = groupedFriends.map{SortedFriends(friends: $0.value, firstLetters: String($0.key))}
        sortedFriends.sort {$0.firstLetters < $1.firstLetters}
        self.tableView.reloadData()
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFriends.map { $0.firstLetters }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firstLetters[section]
    }
}

