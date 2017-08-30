//
//  ContactsInfoModel+Send.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import MessageUI

extension ContactsInfoModel: MFMailComposeViewControllerDelegate {
    
    func send() {
        if !MFMailComposeViewController.canSendMail() {
            STRouter.showAlertOk("Mail services are not available")
            return
        }
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = self
     
        vc.setToRecipients([self.contactDescr ?? ""])
        vc.setSubject("Здравствуйте!")
        vc.setMessageBody("Текст", isHTML: false)
        STRouter.present(vc)
        self.composeVC = vc
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
