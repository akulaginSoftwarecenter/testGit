//
//  NotificationsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 NotificationsViewController
 */

class NotificationsViewController: UIViewController {
    
    var items: [RNSNotificationModel]?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadItems()
    }
    
    func loadItems() {
        STRouter.showLoader()
        print("updateUI RNSPostNotificationList")
        RNSPostNotificationList {[weak self] (reply, error, _) in
            STRouter.removeLoader()
            self?.items = reply as?[RNSNotificationModel]
            self?.tableView.reloadData()
        }
    }
    
    override class var storyboardName: String {
        return "NotificationsViewController"
    }
}
