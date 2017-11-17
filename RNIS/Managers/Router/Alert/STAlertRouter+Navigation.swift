//
//  STAlertRouter+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension STAlertRouter {
    
    static func showRepeatCode() {
        showOk("Код выслан повторно")
    }
    
    static func showErrorNetwork() {
        STAlertRouter.showOk(errorNetwork)
    }
    
    @discardableResult static func showOk(_ message: String?, handler: EmptyBlock? = nil) -> RNSAlertViewController? {
        let vc = RNSAlertViewController.controller(message)
        vc?.handlerViewDidLoad = {
            vc?.addBtn(handler: handler)
        }
        present(vc, animated: true)
        return vc
    }
    
    static func showBtns(_ message: String?, leftTitle: String? = "OK", rightTitle: String? = "ОТМЕНА", handlerOk: EmptyBlock? = nil) {
        let vc = RNSAlertViewController.controller(message)
        vc?.handlerViewDidLoad = {
            vc?.addBtns(leftTitle, rightTitle, handlerOk: handlerOk)
        }
        present(vc, animated: true)
    }
    
    static func showRegistration() {
        let message = "Зарегистрируйтесь, чтобы открыть все возможности приложения"
        STAlertRouter.showBtns(message, leftTitle: "Регистрация", rightTitle: "Позже", handlerOk: STRouter.showLogin)
    }
}
