//
//  NotificationsSettingsViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension NotificationsSettingsViewController {
    
    @IBAction func actionSave(_ sender: Any) {
        STRouter.pop()
        //self.handlerNotification?(notificationPicker.selectedRow(inComponent: 0))
    }
    
    @IBAction func actionRemove(_ sender: Any) {
        STRouter.showLoader()
        RNSPostNotificationDelete(item) {
            STRouter.removeLoader()
            STRouter.pop()
        }
    }
}
