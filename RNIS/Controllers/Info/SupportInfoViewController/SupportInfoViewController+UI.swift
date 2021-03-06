//
//  SupportInfoViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с интерфейсом
 */
extension SupportInfoViewController {

    func prepareUI() {
        contactField.text = RNSInfoManager.email
        topTitle.text = type.rawValue
        
        blackButton.handlerAction = { [weak self] in
            self?.checkValidFields()
        }
        prepareMessage()
    }
     
    func prepareError(_ error: String?) {
        guard let error = error, !error.isEmpty else {
            return
        }
        STAlertRouter.showOk(error)
    }
    
    func prepareMessage() {
        messageView.text = message
    }
}
