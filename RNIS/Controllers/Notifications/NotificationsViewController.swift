//
//  NotificationsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class NotificationModel: NSObject {
    var autoNumber: String!
    var street: String!
    var time: Int!
}

class NotificationsViewController: UIViewController {

    lazy var testArray: [NotificationModel] = {
        var testArray = [NotificationModel]()
        for i in 0...5 {
            let model = NotificationModel()
            if i % 2 == 0 {
                model.autoNumber = "A557"
                model.street = "Лиговский проспект 22"
                model.time = 60
            } else {
                model.autoNumber = "A96"
                model.street = "Улица Петроградская"
                model.time = 20
            }
            testArray.append(model)
        }
        return testArray
    }()
    
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
            //self?.items = reply as?[RNSRouteVariant]
            self?.tableView.reloadData()
        }
    }
    
    override class var storyboardName: String {
        return "NotificationsViewController"
    }
}
