//
//  MenuViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit
import Social

class RNSLeftMenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var menuItems: [MenuItem] {
        return RNSMenuManager.menuItems
    }
    @IBOutlet weak var backLoaderView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    lazy var loaderView:LoaderView = LoaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
        loadData()
        prepareHandlers() 
    }
    
    func prepareUI() {
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.layer.masksToBounds = true
        self.editButton.layer.cornerRadius = self.editButton.frame.width / 2
        
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "MenuTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MenuTableViewCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    
    func loadData() {
        loaderView.showInView(backLoaderView)
        RNSPostUserGet {[weak self] (reply, error, _) in
            self?.loaderView.remove()
            self?.updateUI(reply as? RNSUserPayload)
        }
    }
    
    func updateUI(_ item: RNSUserPayload?) {
        nameLabel.text = item?.name
        phoneLabel.text = item?.formatPhone
        item?.loadImage { [weak self] image in
            self?.profileImageView.image = image ?? #imageLiteral(resourceName: "avatarPlaceholderImage")
        }
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerLeftMenuUpdate = { [weak self] in
            self?.loadData()
        }
    }
    
    override class var storyboardName: String {
        return "RNSLeftMenuController"
    }
}
