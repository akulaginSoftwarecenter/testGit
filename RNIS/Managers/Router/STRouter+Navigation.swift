//
//  STRouter+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

extension STRouter {
    
    static func showInfo() {
        prepareRoot(MainInfoViewController.initialController)
    }
    
    static func revertLogin() {
        prepareRoot(RNSLoginViewController.initialController)
        showLogin()
    }
    
    static func showMap() {
        RNSMapViewController.controller.pushAnimated {
            showAlertRegistrationIfNeed()
        }
    }
    
    static func showLogin() {
        clearNav()
        push(imageBoardContainer(RNSLoginViewController.controller))
    }
    
    static func showRegistration() {
        showLogin()
        push(imageBoardContainer(RNSRegistrationPhoneController.controller))
    }
    
    static func showAlertRepeatCode() {
        showAlertOk("Код выслан повторно")
    }
    
    static func showAlertOk(_ message: String?) {
        let vc = RNSAlertViewController.controller(message)
        vc?.handlerViewDidLoad = {
            vc?.addBtn()
        }
        present(vc, animated: true)
    }
    
    static func showAlertBtns(_ message: String?, leftTitle: String? = "OK", rightTitle: String? = "ОТМЕНА", handlerOk: EmptyBlock? = nil) {
        let vc = RNSAlertViewController.controller(message)
        vc?.handlerViewDidLoad = {
            vc?.addBtns(leftTitle, rightTitle, handlerOk: handlerOk)
        }
        present(vc, animated: true)
    }
    
    static func showAlertRegistrationIfNeed(){
        if !UserDefaults.launchedBefore  {
            showAlertRegistration()
            UserDefaults.setLaunchedBeforeComplete()
        }
    }
    
    static func showAlertRegistration() {
        let message = "Зарегистрируйтесь, чтобы открыть все возможности приложения"
        STRouter.showAlertBtns(message, leftTitle: "Регистрация", rightTitle: "Позже", handlerOk: STRouter.showRegistration)
    }
}
