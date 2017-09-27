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
        prepareHandlers()
    }
    
    func prepareUI() {
        profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        profileImageView.layer.masksToBounds = true
        editButton.layer.cornerRadius = self.editButton.frame.width / 2
        tableView.tableFooterView = UIView();
        prepareProfile()
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerLeftMenuUpdate = { [weak self] in
            self?.prepareProfile()
        }
    }
    
    override class var storyboardName: String {
        return "RNSLeftMenuController"
    }
}
