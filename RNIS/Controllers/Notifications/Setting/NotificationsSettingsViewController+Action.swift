//
//  NotificationsSettingsViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для обработки нажатий кнопок
extension NotificationsSettingsViewController {
    
    /// Нажатие на кнопку "сохранить"
    @IBAction func actionSave(_ sender: Any) {
        let result = notificationPicker.selectedRow(inComponent: 0)
        guard item?.notification_time != result  else {
            STRouter.pop()
            return
        }
        item?.notification_time = result
        STRouter.showLoader()
        RNSPostNotificationUpdate(item) {
            STRouter.removeLoader()
            STRouter.pop()
        }
    }
    
    /// Нажатие на кнопку "удалить"
    @IBAction func actionRemove(_ sender: Any) {
        STRouter.showLoader()
        RNSPostNotificationDelete(item?.uuid) {
            STRouter.removeLoader()
            STRouter.pop()
        }
    }
}
