//
//  NotificationsViewController+Items.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension NotificationsViewController {
    
    func loadItems() {
        STRouter.showLoader()
        RNSPostNotificationList {[weak self] (reply, error, _) in
            self?.removeLoader()
            if error != nil {
                self?.parseError(error)
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
    
    func parseError(_ error: NSError?) {
        if error?.isLostInet ?? false {
            prepareLostInet()
        } else {
            prepareTextTop(error?.domain)
        }
    }
    
    func prepareTextTop(_ text: String?) {
        loaderWay.prepareTextTop(view,text: text, frame: rectError)
        clearItems()
    }
    
    func clearItems() {
        prepareItems(nil)
    }
     
    func removeLoader() {
        STRouter.removeLoader()
    }
    
    var rectError: CGRect {
        let top = CGFloat(82)
        return CGRect(x: 0, y: top, width: UIScreen.width, height: UIScreen.height - top)
    }
    
    func prepareLostInet() {
        loaderWay.showCenterLostInet(self.view, frame: rectError)
        prepareItems(nil)
    }
    
    func clearError() {
        loaderWay.remove()
    }
}
