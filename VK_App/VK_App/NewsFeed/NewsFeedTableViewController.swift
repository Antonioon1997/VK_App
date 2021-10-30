//
//  NewsFeedTableViewController.swift
//  VK_App
//
//  Created by Антон Онищенко on 06.04.2021.
//

import UIKit
import AVKit
import SideMenu

class NewsFeedTableViewController: UITableViewController {
    
    var sideMenu: SideMenuNavigationController?
    
    var indexPathForPhoto: IndexPath!
    var cellTag: Int!
    var imageTag: Int!
    var postTextTag: Int!
    var photoForFullscreen: UIImageView!
    let networkService = NetworkService()
    var newsAttach = [Item?] ()
    var newsAuthor = [Group?] ()
    var isWidthPhoto = false
    let appDelegate = AppDelegate()
    
    var photoNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.didLoadedFirstScreen = true
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: "NewsFeedCell")
        self.tableView.register(UINib(nibName: "NewsFeedHeaderCell", bundle: nil), forCellReuseIdentifier: "NewsFeedHeaderCell")
        self.tableView.register(UINib(nibName: "NewsFeedFooterCell", bundle: nil), forCellReuseIdentifier: "NewsFeedFooterCell")
        self.tableView.register(UINib(nibName: "NewsFeedTextMain", bundle: nil), forCellReuseIdentifier: "NewsFeedTextMain")
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        
        self.navigationController?.navigationBar.barTintColor = Presets.init().vkDarkGray
        
        sideMenu = SideMenuNavigationController(rootViewController: SideBarViewController())
        sideMenu?.setSidebar(sideMenu, self.view)
        
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 5))
        self.tableView.contentInset = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        
        Thread { [self] in
            networkService.getNews { [weak self] response in
                guard let groups = response?.groups,
                      let items = response?.items?.filter({$0.postType != nil})
                        
                else {
                    self?.tableView.reloadData()
                    return }
                
                self?.newsAuthor = groups
                self?.newsAttach = items
                
                self?.tableView.reloadData()
            }
        }.start()
    }
}

extension NewsFeedTableViewController {
    
    // MARK: - Rows settings
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        guard !newsAttach.isEmpty else { return 0}
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 70
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            guard !newsAttach.isEmpty,
                  let picWidth = newsAttach[indexPath.section]?.attachments?[0].photo?.sizes.last?.width,
                  let picHeigth =  newsAttach[indexPath.section]?.attachments?[0].photo?.sizes.last?.height
                    
            else { return 0 }
            let ratio =  CGFloat(picWidth) / CGFloat(picHeigth)
            return tableView.frame.width / ratio }
        else if indexPath.row == 0 && newsAttach[indexPath.section]?.text == "" || newsAttach[indexPath.section]?.text == nil {
            return 0
        }
        return UITableView.automaticDimension
        
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    //MARK: - Rows Data Source
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedHeaderCell") as! NewsFeedHeaderCell
        
        guard !newsAttach.isEmpty,
              let ownerID = newsAttach[section]?.sourceID,
              let ownerData = newsAuthor.filter({ $0?.id == -ownerID }).first,
              let posDate = newsAttach[section]?.date
        else { return headerCell }
        
        headerCell.avatarImageView.kf.setImage(with: URL(string: ownerData?.photo200 ?? ownerData?.photo100 ?? ownerData?.photo50 ?? ""))
        headerCell.ownerNameLabel.text = ownerData?.name
        headerCell.dateLabel.text = Presets.init().setDateFormat(posDate)
        
        return headerCell
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let textCell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTextMain") as! NewsFeedTextMain
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        guard  !newsAttach.isEmpty,
               let postData = newsAttach[indexPath.section] else { return textCell }
        
        if indexPath.row == 1 {
            cell.firstImageView.kf.setImage(with: URL(string: (postData.attachments?[photoNumber].photo?.sizes.last?.url ?? "")))
            
            return cell
        }
        
        textCell.newsFeedText.text = postData.text
        return textCell
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerCell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedFooterCell") as! NewsFeedFooterCell
        
        guard !newsAttach.isEmpty,
              newsAttach[section]?.likes?.count != nil,
              let footerData = newsAttach[section],
              let likesCount = footerData.likes?.count,
              let isLiked = footerData.likes?.userLikes,
              let commentsCount = footerData.comments?.count,
              let shareCount = footerData.reposts?.count
        else {
            
            footerCell.isHidden = true
            return footerCell
        }
        
        footerCell.likeCountLabel.text = "\(likesCount)"
        footerCell.commentCountLabel.text = "\(commentsCount)"
        footerCell.shareCountLabel.text = "\(shareCount)"
        if isLiked == 1 {
            footerCell.likeImageView.tintColor = .red
        } else { footerCell.likeImageView.tintColor = Presets.init().vkLightGray }
        
        return footerCell
    }
    
    
    //MARK: - Actions
    
    @IBAction func openSidebar () {
        
        present(sideMenu!, animated: true)
    }
    
}


