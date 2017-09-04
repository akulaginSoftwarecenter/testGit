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
        self.navigationController?.popViewController(animated: true)
    }
}
