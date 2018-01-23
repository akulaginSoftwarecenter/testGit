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
    lazy var loaderWay = RNSLoaderWay()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView();
        prepareHandlers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Utils.checkTokeShowAlert()
        loadItems()
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerUpdateNotification = { [weak self] in
            self?.loadItems()
        }
    }
}
