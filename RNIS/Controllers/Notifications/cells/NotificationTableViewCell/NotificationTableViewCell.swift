//
//  NotificationTableViewCell.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var autoNumberLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.autoNumberLabel.layer.cornerRadius = 5
        self.autoNumberLabel.layer.masksToBounds = true
    }

    func updateCell(model: NotificationModel) {
        self.autoNumberLabel.text = model.autoNumber
        self.streetLabel.text = model.street
        self.timeLabel.text = model.time
    }
    
}
