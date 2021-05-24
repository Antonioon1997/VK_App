//
//  FriendsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 31.03.2021.
//

import UIKit
import Alamofire
class FriendsTableViewController: UITableViewController {
    let networkServise = NetworkRequests()
    
    var selectedRow: IndexPath! // IndexPath for Segue
    //MARK: - Data

    
    var firstLetters = [String] ()
    var sortedFriends = [SortedFriends] ()
    
    var friends = [
        FriendsData(name: "Сергей Герман", city: "Москва", avatar: UIImage(named: "Сергей Герман")!, friendPhotos: [UIImage(named: "Сергей Герман"), UIImage(named: "Сергей Герман_2"), UIImage(named: "Сергей Герман_3")], id: "16699309"),
        FriendsData(name: "Елизавета Анищенко", city: "Москва", avatar: UIImage(named: "Елизавета Анищенко")!, friendPhotos: [UIImage(named: "Елизавета Анищенко"), UIImage(named: "Елизавета Анищенко_2"), UIImage(named: "Елизавета Анищенко_3")], id: "330941378"),
        FriendsData(name: "Дмитрий Сиюткин", city: "Москва", avatar: UIImage(named: "Дмитрий Сиюткин")!, friendPhotos: [UIImage(named: "Дмитрий Сиюткин"), UIImage(named: "Дмитрий Сиюткин"), UIImage(named: "Дмитрий Сиюткин_3")], id: "63388119"),
        FriendsData(name: "Александр Онищенко", city: "Голицино", avatar: UIImage(named: "Александр Онищенко")!, friendPhotos: [UIImage(named: "Александр Онищенко_2"), UIImage(named: "Александр Онищенко"), UIImage(named: "Александр Онищенко_3")], id: "38959919"),
        FriendsData(name: "Анастасия Онищенко", city: "Голицино", avatar: UIImage(named: "Анастасия Онищенко")!, friendPhotos: [UIImage(named: "Анастасия Онищенко_2"), UIImage(named: "Анастасия Онищенко"), UIImage(named: "Анастасия Онищенко_3")], id: "113379049"),
        FriendsData(name: "Валентин Чуканов", city: "Москва", avatar: UIImage(named: "Валентин Чуканов")!, friendPhotos: [UIImage(named: "Валентин Чуканов"), UIImage(named: "Валентин Чуканов_2"), UIImage(named: "Валентин Чуканов_3")], id: "95986961"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkServise.getFriends(Session.instance.myID, "", "", "online")
        
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

