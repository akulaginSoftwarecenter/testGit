//
//  STAlertRouter+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с навигацией
 */
extension STAlertRouter {
    
    static func showRepeatCode() {
        showOk("Код выслан повторно")
    }
    
    static func showErrorNetwork() {
        STAlertRouter.showOk(errorNetwork)
    }
    
    @discardableResult static func showOk(_ message: String?, handler: EmptyBlock? = nil) -> RNSAlertViewController? {
        let vc = alert(message)
        
        vc?.handlerViewDidLoad = { [weak vc] in
            vc?.addBtn(handler: handler)
        }
        
        present(vc, animated: true)
        return vc
    }
    
    static func showBtns(_ message: String?, leftTitle: String? = "OK", rightTitle: String? = "ОТМЕНА", handlerOk: EmptyBlock? = nil) {
        let vc = alert(message)
        vc?.handlerViewDidLoad = { [weak vc] in
            vc?.addBtns(leftTitle, rightTitle, handlerOk: handlerOk)
        }
        present(vc, animated: true)
    }
    
    static func alert(_ message: String?) -> RNSAlertViewController? {
        guard !isAlertExist(message) else {
            return nil
        }
        addAlert(message)
        return RNSAlertViewController.controller(message)
    }
    
    static func showRegistration() {
        let message = "Зарегистрируйтесь, чтобы открыть все возможности приложения"
        STAlertRouter.showBtns(message, leftTitle: "Регистрация", rightTitle: "Позже", handlerOk: STRouter.showLogin)
    }
}
