//
//  MenuViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class RNSLeftMenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     let menuItems = [MenuItem("Карта", RNSMapViewController.controller, #imageLiteral(resourceName: "menuMapIcon")),
                     MenuItem("Избранное", nil, #imageLiteral(resourceName: "menuStarIcon")),
                     MenuItem("Оповещения", nil, #imageLiteral(resourceName: "menuBellIcon")),
                     MenuItem("Новости", nil, #imageLiteral(resourceName: "menuNewspaperIcon")),
                     MenuItem("Настройки", nil, #imageLiteral(resourceName: "menuSettingsIcon")),
                     MenuItem("Стрелка", nil, #imageLiteral(resourceName: "menuCreditcardIcon")),
                     MenuItem("Информация", nil, #imageLiteral(resourceName: "menuInfoIcon"))]
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.layer.masksToBounds = true
        self.editButton.layer.cornerRadius = self.editButton.frame.width / 2
        
        self.tableView.tableFooterView = UIView();
        self.tableView.register(UINib.init(nibName: "MenuTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MenuTableViewCell")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    }
   
    override class var storyboardName: String {
        return "RNSLeftMenuController"
    }
}
