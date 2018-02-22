//
//  NotificationTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер таблицы нотификаций
 */
class NotificationTableViewCell: RNSBaseTableCell {
   
    /// переменная отображения номера авто
    @IBOutlet weak var autoNumberLabel: UILabel!
    /// переменная отображения улицы
    @IBOutlet weak var streetLabel: UILabel!
    /// переменная отображения времени
    @IBOutlet weak var timeLabel: UILabel!
  
    /// метод обновления ячейки
    func updateCell(model: RNSNotificationModel?) {
        self.autoNumberLabel.text = "A" + (model?.route_number ?? "")
        self.streetLabel.text = model?.stop_point?.name
        self.timeLabel.text = "\(model?.notification_time ?? 0) мин."
    }
}
