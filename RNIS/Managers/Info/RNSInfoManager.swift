//
//  RNSInfoManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import MessageUI
/**
 Контроллер отправки email стандартным почтовым сервисом
 */
class RNSInfoManager: NSObject, MFMailComposeViewControllerDelegate {
    
    static let shared = RNSInfoManager()
    
    var composeVC: MFMailComposeViewController?
    
    static var email: String?
    /// Создание экземпляра почтового сообщения
    func send(_ item: RNSContactItem) {
         sendMail(item.value)
    }
    
    func sendRequest(_ item: URLRequest?) {
        sendMail(item?.url?.strNoURLScheme)
    }
    
    func sendMail(_ email: String?) {
        
        if !MFMailComposeViewController.canSendMail() {
            STAlertRouter.showOk("Mail services are not available")
            return
        }
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = self
        
        vc.setToRecipients([email ?? ""])
        vc.setSubject("Здравствуйте!")
        vc.setMessageBody("Текст", isHTML: false)
        STRouter.present(vc)
        self.composeVC = vc
    }
    
    /// Функция отправки почты
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
