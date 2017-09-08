//
//  RNSContactItem+Send.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSContactItem {
    
    func callOrSend() {
        if isPhone {
            call()
        } else {
            RNSInfoManager.shared.send(self)
        }
    }
    
    func call() {
        if let contactDescr = self.value  {
            let phone = InputFieldsValidator.strip(contactDescr)
            if let phoneCallURL = URL(string:"tel://"+phone) {
                let application = UIApplication.shared
                if (application.canOpenURL(phoneCallURL)) {
                    application.openURL(phoneCallURL)
                }
            }
        }
    }
}
