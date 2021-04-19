//
//  MyGroupsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 01.04.2021.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    private var searchBarIsActive: Bool!
    
    
    //MARK:- Groups Data
    var groups = [
        GroupsData(name: "Reddit", desctription: "Юмор", avatar: UIImage(named: "Reddit")!),
        GroupsData(name: "Видео категории Б", desctription: "Юмор", avatar: UIImage(named: "Видео категории Б")!),
        GroupsData(name: "КЛИЕНТ ВСЕГДА ПРАВ!", desctription: "Юмор", avatar: UIImage(named: "КЛИЕНТ ВСЕГДА ПРАВ!")!),
        GroupsData(name: "SAUCE", desctription: "Юмор", avatar: UIImage(named: "SAUCE")!)
    ]
    
    var searchedGroups = [GroupsData] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
       tableView.backgroundColor = Presets.init().vkDarkGray

        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        self .navigationItem.titleView = searchBar
        self.searchBar.sizeToFit()
//        self.searchBar.isHidden = false
        
//        searchBar.placeholder = "Lets Search"
        searchedGroups = groups
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        var groupsData: GroupsData!
        if searchBarIsActive == true {
            groupsData = searchedGroups[indexPath.row]
        } else {
            groupsData = groups[indexPath.row]
        }

        cell.avatarImage.image = groupsData.avatar
        cell.nameLabel.text = groupsData.name
        cell.descriptionLabel.text = groupsData.desctription

        return cell
//        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addGroup(_ unwindSegue: UIStoryboardSegue) {
    if let sourceViewController = unwindSegue.source as? AddGroupTableViewController,
       unwindSegue.identifier == "AddGroup",
       let rowIndexPath = sourceViewController.tableView.indexPathForSelectedRow{
            let selectedGroup = sourceViewController.addGroups[rowIndexPath.row]
            if !groups.contains(selectedGroup){
                groups.append(selectedGroup)
        
                tableView.reloadData()
        }
    }
        
}
    
}
//MARK: - SearchBar extension

extension MyGroupsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else { searchedGroups = groups
            tableView.reloadData()
            return
        }
        searchedGroups = groups.filter({ (groups) -> Bool in
            groups.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
//
//        searchedGroups = groups.filter({ (group) -> Bool in
//        guard searchBar.text != nil else {
//            searchBarIsActive = false
//            return false }
//            searchBarIsActive = true
//            return group.name.lowercased().contains(searchText.lowercased()) })
//        tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBarIsActive = false
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBarIsActive = false
        tableView.reloadData()
    }
    
}

