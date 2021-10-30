//
//  ContainerViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 15.08.2021.
//

import UIKit

class ContainerViewController: UIViewController, SideBarControllerDelegate {
    
    var controller = UIViewController()
    var sideBarViewController: UIViewController!
    var startingViewConroller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! VKLoginViewController
//    let contr =
    
    var sideBarIsOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("dsfsdfs")

//        configurContainer(startingViewConroller)
        // Do any additional setup after loading the view.
    }
    
    func configurContainer (_ viewController: UIViewController) {
        
        let controller = NewsFeedTableViewController()
        view.addSubview(controller.view)
        addChild(controller)
        controller.delegate = self
    }
    
    func configureSideBarController() {
        if sideBarViewController == nil {
            sideBarViewController = SideBarViewController()
            view.insertSubview(sideBarViewController.view, at: 0)
            addChild(sideBarViewController)
            print("Sidebar открыт")
        }
    }
    
    func showSideBar(_ shouldMove: Bool) {
            
        if shouldMove {
            UIView.animate(withDuration: 0.5,
                            delay: 0,
                            usingSpringWithDamping: 0.8,
                            initialSpringVelocity: 0,
                            options: .curveEaseInOut) {
                self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
            } completion: { (finished) in
                //
            }

        } else {
            UIView.animate(withDuration: 0.5,
                            delay: 0,
                            usingSpringWithDamping: 0.8,
                            initialSpringVelocity: 0,
                            options: .curveEaseInOut) {
                self.controller.view.frame.origin.x = 0
            } completion: { (finished) in
                //
            }
            
        }
    }
    
    func toggleSideBar() {
        
            configureSideBarController()
            sideBarIsOpened.toggle()
            showSideBar(sideBarIsOpened)
    }
    
        
        
}

