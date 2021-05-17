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
    var groupsData: [GroupsData]!
//    let searchBarPlaceholder = UIView.self as? SearchBarPlaceholder
    @IBOutlet var viewForSearchBar: UIView!
    @IBOutlet weak var searchBarPlaceholderIcon: UIImageView!
    @IBOutlet weak var searchBarPlaceholderText: UILabel!
    var position: CGFloat = 0
    let activateSearchImage = UIImage(systemName: "magnifyingglass")
    var placeholderText = "Groups"
    
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
        
        viewForSearchBar.backgroundColor = .clear
        
        searchBarPlaceholderText.text = placeholderText
        searchBarPlaceholderText.backgroundColor = .clear
        searchBarPlaceholderText.textColor = Presets.init().vkLightGray
        searchBarPlaceholderIcon.image = activateSearchImage
        searchBarPlaceholderIcon.tintColor = Presets.init().vkLightGray
        searchBar.searchTextField.placeholder = ""
    
        self.navigationItem.titleView = searchBar
        searchBar.searchTextField.leftView = viewForSearchBar
        
        searchBar.delegate = self
        searchBarIsActive = false
    
        tableView.backgroundColor = Presets.init().vkDarkGray

        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
//        self.searchBar.sizeToFit()
        
        searchedGroups = groups
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        searchBar.searchTextField.leftView?.layer.position.x = 200
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
       
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
//        print (searchBar.searchTextField.leftView?.layer.position)
        if searchBarIsActive == true { groupsData = searchedGroups }
        else { groupsData = groups }
            
        cell.avatarImage.image = groupsData[indexPath.row].avatar
        cell.nameLabel.text = groupsData[indexPath.row].name
        cell.descriptionLabel.text = groupsData[indexPath.row].desctription
        
        if searchBarIsActive == false {
            position = searchBar.searchTextField.layer.bounds.width/2
        viewForSearchBar.layer.position.x = searchBar.searchTextField.layer.bounds.width/2
            
        }
        
        return cell
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
                searchedGroups.append(selectedGroup)
                groups.append(selectedGroup)
                
                tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - ToDo
   
    
    @objc func activateSearchBarAnimated () {
        if searchBar.isFocused == true || searchBarIsActive == true{
            
        }
        
        
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBarIsActive = true
        
        viewForSearchBar.layer.position.x = 500
    }
    
}
//MARK: - SearchBar extension

extension MyGroupsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
        
        guard !searchText.isEmpty else { searchedGroups = groups
            tableView.reloadData()
            searchBarIsActive = false
//            searchBarPlaceholderText.text = " "
            return
        }
        searchBarIsActive = true
        
        searchedGroups = groups.filter({ (groups) -> Bool in
            groups.name.lowercased().contains(searchText.lowercased())
        })
        
        
        tableView.reloadData()
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let transition = CABasicAnimation(keyPath: "position.x")
        transition.fromValue = searchBar.searchTextField.layer.bounds.width/2 - 150
        transition.toValue = searchBar.searchTextField.leftView
        
        
        let scale = CABasicAnimation(keyPath: "transform.scale.x")
        scale.fromValue = 1
        scale.toValue = 0.5
        
        let disappear = CABasicAnimation(keyPath: "opacity")
        disappear.fromValue = 1
        disappear.toValue = 0.5
        disappear.duration = 0.25
        
        let comp = CAAnimationGroup ()
        comp.animations = [transition]
        comp.duration = 0.25
        
    
          
            searchBarPlaceholderText.layer.add(disappear, forKey: nil)
            viewForSearchBar.layer.add(comp, forKey: nil)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [self] in
//            searchBar.searchTextField.leftView = searchBarPlaceholderIcon
            searchBarPlaceholderText.text = ""
            searchBar.searchTextField.placeholder = placeholderText
//            searchBar.showsCancelButton = true
            
        }
        
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
        groupsData = groups
        searchBarIsActive = false
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarPlaceholderText.isHidden = true
        searchBarPlaceholderText.text = placeholderText
        let transition = CABasicAnimation(keyPath: "position.x")
        transition.fromValue = searchBar.searchTextField.leftView?.layer.position.x
//        searchBar.searchTextField.layer.bounds.width/2
        transition.toValue = searchBar.searchTextField.layer.bounds.size.width/3
        
        let appear = CABasicAnimation(keyPath: "opacity")
        appear.fromValue = 0
        appear.toValue = 1
        appear.duration = 0.25
        
        let comp = CAAnimationGroup ()
        comp.animations = [transition]
        comp.duration = 0.25
        
        searchBar.searchTextField.placeholder = ""
        searchBar.searchTextField.leftView = viewForSearchBar
        searchBarPlaceholderText.layer.add(appear, forKey: nil)
        viewForSearchBar.layer.add(comp, forKey: nil)
//        searchBarPlaceholderText.layer.add(comp, forKey: nil)
        searchBarPlaceholderIcon.layer.add(comp, forKey: nil)
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) { [self] in
            searchBarPlaceholderText.isHidden = false
        searchBar.searchTextField.leftView?.layer.position.x =  position
        searchBarPlaceholderText.text = placeholderText
        searchBarPlaceholderText.layer.add(appear, forKey: nil)
        searchBar.searchTextField.leftView = viewForSearchBar

    }
        
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
        searchBarIsActive = false
        
        tableView.reloadData()
    }
   
    
    
}


