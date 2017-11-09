//
//  STRouter+Navigation.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

extension STRouter {
    /*
    static func showMap() {
        RNSMapViewController.controller.pushAnimated {
            showAlertRegistrationIfNeed()
        }
    }
    */
    static func showMenu() {
        RNSMenuViewController.initialController.pushAnimated()
    }
    /*
    static func showRegistration() {
        showLogin()
        push(imageBoardContainer(RNSRegistrationPhoneController.controller))
    }
    */
    static func showAlertRepeatCode() {
        showAlertOk("Код выслан повторно")
    }
    
    static func showAlertErrorNetwork() {
        STRouter.showAlertOk(errorNetwork)
    }
    
    @discardableResult static func showAlertOk(_ message: String?, handler: EmptyBlock? = nil) -> RNSAlertViewController? {
        let vc = RNSAlertViewController.controller(message)
        vc?.handlerViewDidLoad = {
            vc?.addBtn(handler: handler)
        }
        present(vc, animated: true)
        return vc
    }
    
    static func showAlertBtns(_ message: String?, leftTitle: String? = "OK", rightTitle: String? = "ОТМЕНА", handlerOk: EmptyBlock? = nil) {
        let vc = RNSAlertViewController.controller(message)
        vc?.handlerViewDidLoad = {
            vc?.addBtns(leftTitle, rightTitle, handlerOk: handlerOk)
        }
        present(vc, animated: true)
    }
    /*
    static func showAlertRegistrationIfNeed(){
        if !UserDefaults.launchedBefore  {
            showAlertRegistration()
            UserDefaults.setLaunchedBeforeComplete()
        }
    }
    */
    static func showLogin() {
        showLogin(animated: true)
    }

    static func showAfterLogout(animated: Bool) {
        guard let mapController = RNSMenuManager.shared.mapVC, let loginController = imageBoardContainer(RNSLoginViewController.controller) else {
            return
        }
        STRouter.rootViewController.setViewControllers([mapController, loginController], animated: animated)
    }

    static func showLogin(animated: Bool) {
        RNSLoginViewController.controller.pushAnimatedImageBoard(animated: animated)
    }
    
    static func showAlertRegistration() {
        let message = "Зарегистрируйтесь, чтобы открыть все возможности приложения"
        STRouter.showAlertBtns(message, leftTitle: "Регистрация", rightTitle: "Позже", handlerOk: STRouter.showLogin)
    }
}
