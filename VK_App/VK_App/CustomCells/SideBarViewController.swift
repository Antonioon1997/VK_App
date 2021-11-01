//
//  SideBarViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 15.08.2021.
//

import UIKit
import SideMenu

class SideBarViewController: UITableViewController {
    
    let items = ["Мой профиль"]
    var sideMenu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SideBarCell")

        view.backgroundColor = Presets().vkDarkGray
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideBarCell", for: indexPath)
       
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        var destination = UIViewController()
        
//        switch indexPath.row {
//        case 0:
//            destination = FriendScreenTableViewController()
//        default:
//            destination = FriendScreenTableViewController()
//        }
        
//        present(FriendsTableViewController(), animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "GroupVC")
        self.navigationController?.pushViewController(FriendScreenTableViewController(), animated: true)
//        performSegue(withIdentifier: "ShowFriendScreen", sender: self)
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SideMenuNavigationController {
    
    func setSidebar(_ bar: SideMenuNavigationController?, _ view: UIView) {
//        bar?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = bar
//        SideMenuManager.default.addPanGestureToPresent(toView: view)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }
}
