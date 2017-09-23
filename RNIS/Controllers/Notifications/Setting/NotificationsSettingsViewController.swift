//
//  NotificationsSettingsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class NotificationsSettingsViewController: UIViewController {

    var handlerNotification: ((Int) -> ())?
    @IBOutlet weak var notificationPicker: UIPickerView!
    
    override class var storyboardName: String {
        return "NotificationsSettingsViewController"
    }

    func setIntialValue(_ value: Int) {
        _ = view
        guard value < notificationPicker.numberOfRows(inComponent: 0) else {
            return
        }
        notificationPicker.selectRow(value, inComponent: 0, animated: true)
    }
}
