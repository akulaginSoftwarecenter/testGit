//
//  NotificationsSettingsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 NotificationsSettingsViewController
 */

class NotificationsSettingsViewController: UIViewController {

    var handlerNotification: ((Int) -> ())?
    var item: RNSNotificationModel?
    
    let maxValue = 100
    
    @IBOutlet weak var notificationPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preparePicker()
    }
    
    func preparePicker() {
        setIntialValue(item?.notification_time)
    }

    func setIntialValue(_ value: Int? ) {
        guard let value = value,
            value < notificationPicker.numberOfRows(inComponent: 0) else {
                return
        }
        notificationPicker.selectRow(value, inComponent: 0, animated: true)
    }
   
    override class var storyboardName: String {
        return "NotificationsSettingsViewController"
    }
}
