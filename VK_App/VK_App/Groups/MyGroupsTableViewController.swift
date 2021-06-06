//
//  MyGroupsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 01.04.2021.
//

import UIKit
import Alamofire

class MyGroupsTableViewController: UITableViewController {
    
    private let networkServise = NetworkService()
    
    @IBOutlet weak var searchBar: UISearchBar!
    private var searchBarIsActive: Bool!
    var groupsData = [VKGroups] ()
//    @IBOutlet var viewForSearchBar: UIView!
//    @IBOutlet weak var searchBarPlaceholderIcon: UIImageView!
//    @IBOutlet weak var searchBarPlaceholderText: UILabel!
//    var position: CGFloat = 0
//    let activateSearchImage = UIImage(systemName: "magnifyingglass")
//    var placeholderText = "Groups"
 
    
    
    //MARK:- Groups Data
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkServise.getGroups(Session.instance.myID, "1", "", "", "", "50") { [weak self] response in
            self?.groupsData = response.response.items
            print(self?.groupsData)
            self?.tableView.reloadData()
        }
        searchBar.searchTextField.placeholder = "Groups"
    
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
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
//        guard !groupsData.isEmpty else { return 1 }
        return groupsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
//        guard !groupsData.isEmpty else { return cell }
        let groups = groupsData[indexPath.row]
        cell.avatarImage.image = UIImage(data: try! Data(contentsOf: groups.avatar.asURL()))
        cell.nameLabel.text = groups.name
       
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {

        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBarIsActive = true
        
//        viewForSearchBar.layer.position.x = 500
    }
    
}
//MARK: - SearchBar extension

extension MyGroupsTableViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        guard !searchText.isEmpty else { searchedGroups = groups
//            tableView.reloadData()
//            searchBarIsActive = false
//
//            return
//        }
//        searchBarIsActive = true
//
//        searchedGroups = groups.filter({ (groups) -> Bool in
//            groups.name.lowercased().contains(searchText.lowercased())
//        })
//
//        tableView.reloadData()
//    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        let transition = CABasicAnimation(keyPath: "position.x")
//        transition.fromValue = searchBar.searchTextField.layer.bounds.width/2 - 150
//        transition.toValue = searchBar.searchTextField.leftView
//
//        let scale = CABasicAnimation(keyPath: "transform.scale.x")
//        scale.fromValue = 1
//        scale.toValue = 0.5
//
//        let disappear = CABasicAnimation(keyPath: "opacity")
//        disappear.fromValue = 1
//        disappear.toValue = 0.5
//        disappear.duration = 0.25
//
//        let comp = CAAnimationGroup ()
//        comp.animations = [transition]
//        comp.duration = 0.25
//
//            searchBarPlaceholderText.layer.add(disappear, forKey: nil)
//            viewForSearchBar.layer.add(comp, forKey: nil)
//
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [self] in
//            searchBarPlaceholderText.text = ""
//            searchBar.searchTextField.placeholder = placeholderText
//
//        }
//
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
//        groupsData = groups
        searchBarIsActive = false
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchBarPlaceholderText.isHidden = true
//        searchBarPlaceholderText.text = placeholderText
//        let transition = CABasicAnimation(keyPath: "position.x")
//        transition.fromValue = searchBar.searchTextField.leftView?.layer.position.x
//        transition.toValue = searchBar.searchTextField.layer.bounds.size.width/3
//
//        let appear = CABasicAnimation(keyPath: "opacity")
//        appear.fromValue = 0
//        appear.toValue = 1
//        appear.duration = 0.25
//
//        let comp = CAAnimationGroup ()
//        comp.animations = [transition]
//        comp.duration = 0.25
//
//        searchBar.searchTextField.placeholder = ""
//        searchBar.searchTextField.leftView = viewForSearchBar
//        searchBarPlaceholderText.layer.add(appear, forKey: nil)
//        viewForSearchBar.layer.add(comp, forKey: nil)
//        searchBarPlaceholderIcon.layer.add(comp, forKey: nil)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) { [self] in
//
//            searchBarPlaceholderText.isHidden = false
//            searchBar.searchTextField.leftView?.layer.position.x =  position
//            searchBarPlaceholderText.text = placeholderText
//            searchBarPlaceholderText.layer.add(appear, forKey: nil)
//            searchBar.searchTextField.leftView = viewForSearchBar
//    }
//
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
        searchBarIsActive = false
        
        tableView.reloadData()
    }
}


