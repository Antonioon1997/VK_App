//
//  MyGroupsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 01.04.2021.
//

import UIKit
import Alamofire
import RealmSwift

class MyGroupsTableViewController: UITableViewController {
    
    private let networkServise = NetworkService()
    
    @IBOutlet weak var searchBar: UISearchBar!
    private var searchBarIsActive: Bool!
    var groupsData = try? RealmService.load(typeOf: VKGroupsRealm.self)
    var token: NotificationToken?
    
    
    //MARK:- Groups Data
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkServise.getGroups(Session.instance.myID, "1", "", "", "", "50") { [weak self] response in
            guard let groups = response else { return }
            try? RealmService.save(items: groups)
            
            self?.tableView.reloadData()
        }
        searchBar.searchTextField.placeholder = "Groups"
    
        self.navigationItem.titleView = searchBar
        searchBarIsActive = false
    
        tableView.backgroundColor = Presets.init().vkDarkGray

        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return groupsData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
//        guard !groupsData.isEmpty else { return cell }
        guard let groups = groupsData?[indexPath.row] else { return cell }
        cell.avatarImage.kf.setImage(with: URL(string: groups.avatar))
        cell.nameLabel.text = groups.name
        cell.messageButton.isHidden = true
        cell.callButton.isHidden = true
       
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {

        }
    }
    private func observeRealm() {
        token = groupsData?.observe({ changes in
            switch changes {
            case .initial(let results):
                if results.count > 0 {
                    self.tableView.reloadData()
                }
                
            case let .update(results, deletions, insertions, modifications):
                print(results, deletions, insertions, modifications)
//                self.collectionView.reloadData()
                
            case .error(let error):
                print(error)
            }
        })
    }
 
}


