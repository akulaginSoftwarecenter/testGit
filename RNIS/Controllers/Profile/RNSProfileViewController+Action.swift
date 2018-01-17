//
//  RNSProfileViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSProfileViewController {
    
    /// Событие нажатия на кнопку смены номера телефона
    @IBAction func actionPhone(_ sender: Any) {
        checkExit {
            let container = STRouter.imageScrollContainer(RNSChangePhoneController.controller)
            STRouter.pushMain(container)
        }
    }
    
    /// Событие нажатия на кнопку смены пароля
    @IBAction func actionPassword(_ sender: Any) {
        checkExit {
            let container = STRouter.imageScrollContainer(RNSChangePasswordController.initialController)
            STRouter.pushMain(container)
        }
    }
    
    @IBAction func nameChange(_ sender: Any) {
        checkShowBtnName()
    }
    
    @IBAction func emailChange(_ sender: Any) {
        checkShowBtnEmail()
    }
    
    @IBAction func actionName(_ sender: Any) {
        changeNameIfNeed()
    }
    
    @IBAction func actionEmaill(_ sender: Any) {
        changeEmailIfNeed()
    }
    
    @IBAction func actionExit(_ sender: Any) {
        checkExit {
            RNSMenuManager.showLeftMenu()
        }
    }
    
    @IBAction func actionEmail(_ sender: Any) {
        checkExit {
            let container = STRouter.imageScrollContainer(RNSChangeEmailController.controller)
            STRouter.pushMain(container)
        }
    }
      
    /// Настройка кнопки выхода
    func prepareBlackButton() {
        blackButton.handlerAction = { [weak self] in
            self?.showAlert()
        }
    }
}
