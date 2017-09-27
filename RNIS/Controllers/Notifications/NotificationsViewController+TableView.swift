//
//  NotificationsViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 27.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension NotificationsViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testArray.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell;
        let model = self.testArray[indexPath.row]
        cell.updateCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = self.testArray[indexPath.row]
        
        let controller = NotificationsSettingsViewController.initialController as! NotificationsSettingsViewController
        controller.setIntialValue(model.time)
        controller.handlerNotification = { [weak self] notification in
            guard let `self` = self else { return }
            model.time = notification
            self.tableView.reloadData()
        }
        controller.pushAnimatedRed()
    }
}
