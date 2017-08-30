//
//  ContactsInfoModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import MessageUI

class ContactsInfoModel: NSObject {
    
    var contactType: contactType?
    var contactTitle: String?
    var contactDescr: String?
    
    var composeVC: MFMailComposeViewController?
    
    func callOrSend() {
        if contactType == .contactTypePhone {
            call()
        } else {
            send()
        }
    }
    
    func call() {
        if let contactDescr = self.contactDescr  {
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
