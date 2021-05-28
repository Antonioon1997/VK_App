//
//  AddGroupTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 02.04.2021.
//

import UIKit
import Alamofire

class AddGroupTableViewController: UITableViewController {
    
    private let networkServise = NetworkService()
    
   
    var selectedRow: IndexPath!


    override func viewDidLoad() {
        super.viewDidLoad()
//        networkServise.getSearchedGroups("Reddit", "", "", "", "", "", "0", "", "4")
           
        self.view.backgroundColor = Presets.init().vkDarkGray

        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow = indexPath
        performSegue(withIdentifier: "AddGroup", sender: nil)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell


        return cell
    }
}
