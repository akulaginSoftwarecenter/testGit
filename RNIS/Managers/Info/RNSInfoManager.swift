//
//  RNSInfoManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import MessageUI

class RNSInfoManager: NSObject, MFMailComposeViewControllerDelegate {
    
    static let shared = RNSInfoManager()
    
    var composeVC: MFMailComposeViewController?
    
    func send(_ item: RNSContactItem) {
        
         if !MFMailComposeViewController.canSendMail() {
         STRouter.showAlertOk("Mail services are not available")
         return
         }
         let vc = MFMailComposeViewController()
         vc.mailComposeDelegate = self
         
         vc.setToRecipients([item.value ?? ""])
         vc.setSubject("Здравствуйте!")
         vc.setMessageBody("Текст", isHTML: false)
         STRouter.present(vc)
         self.composeVC = vc
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
