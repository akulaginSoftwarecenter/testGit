//
//  NotificationsSettingsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер настроек уведомлений
 */
class NotificationsSettingsViewController: UIViewController {

    /// Обработчик изменений пикера
    var handlerNotification: ((Int) -> ())?
    /// Модель уведомления
    var item: RNSNotificationModel?
    
    let maxValue = 100
    
    @IBOutlet weak var notificationPicker: UIPickerView!
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preparePicker()
    }
    
    /// Настройка пикера
    func preparePicker() {
        setIntialValue(item?.notification_time)
    }

    /// Настройка начального значения пикера
    ///
    /// - Parameter value: начальное значение
    func setIntialValue(_ value: Int? ) {
        guard let value = value,
            value < notificationPicker.numberOfRows(inComponent: 0) else {
                return
        }
        notificationPicker.selectRow(value, inComponent: 0, animated: true)
    }
}
