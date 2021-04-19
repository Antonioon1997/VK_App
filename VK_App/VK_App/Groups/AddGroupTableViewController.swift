//
//  AddGroupTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 02.04.2021.
//

import UIKit

class AddGroupTableViewController: UITableViewController {
    
    var addGroups = [
        GroupsData(name: "GabeStore", desctription: "Игры, игрушки", avatar: UIImage(named: "GabeStore")!),
        GroupsData(name: "Вижу рифмы", desctription: "Юмор", avatar: UIImage(named: "Вижу рифмы")!),
        GroupsData(name: "Ridddle", desctription: "Наука", avatar: UIImage(named: "Ridddle")!),
        GroupsData(name: "Marmok", desctription: "Игры", avatar: UIImage(named: "Marmok")!)
    ]
    var selectedRow: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Presets.init().vkDarkGray

        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addGroups.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath
        performSegue(withIdentifier: "AddGroup", sender: nil)
        
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        cell.avatarImage.image = addGroups[indexPath.row].avatar
        cell.descriptionLabel.text = addGroups[indexPath.row].desctription
        cell.nameLabel.text = addGroups[indexPath.row].name

        return cell
    }
    
}
