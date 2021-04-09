//
//  MyGroupsTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 01.04.2021.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    var groups = [
        GroupsData(name: "Reddit", desctription: "Юмор", avatar: UIImage(named: "Reddit")!),
        GroupsData(name: "Видео категории Б", desctription: "Юмор", avatar: UIImage(named: "Видео категории Б")!),
        GroupsData(name: "КЛИЕНТ ВСЕГДА ПРАВ!", desctription: "Юмор", avatar: UIImage(named: "КЛИЕНТ ВСЕГДА ПРАВ!")!),
        GroupsData(name: "SAUCE", desctription: "Юмор", avatar: UIImage(named: "SAUCE")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.backgroundColor = Colors.init().vkDarkGray

        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        cell.avatarImage.image = groups[indexPath.row].avatar
        cell.nameLabel.text = groups[indexPath.row].name
        cell.descriptionLabel.text = groups[indexPath.row].desctription

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
