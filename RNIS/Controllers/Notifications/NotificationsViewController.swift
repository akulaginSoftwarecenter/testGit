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
        
        loadItems()
    }
    
    func prepareHandlers() {
        RNSMenuManager.handlerUpdateNotification = { [weak self] in
            self?.loadItems()
        }
    }
    
    func loadItems() {
        STRouter.showLoader()
        RNSPostNotificationList {[weak self] (reply, error, _) in
            self?.removeLoader()
            if error?.isLostInet ?? false {
                self?.prepareLostInet()
                return
            }
            self?.clearError()
            self?.prepareItems(reply as? [RNSNotificationModel])
        }
    }
    
    func prepareItems(_ items: [RNSNotificationModel]?) {
        self.items = items
        tableView.reloadData()
    }
    
    func removeLoader() {
        STRouter.removeLoader()
    }
    
    func prepareLostInet() {
        let top = CGFloat(82)
        loaderWay.showCenterLostInet(self.view, frame: CGRect(x: 0, y: top, width: UIScreen.width, height: UIScreen.height - top))
        prepareItems(nil)
    }
    
    func clearError() {
        loaderWay.remove()
    }
}
