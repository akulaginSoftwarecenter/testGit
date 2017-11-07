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
        RNSChangePhoneController.controller.pushAnimatedImageScroll()
    }
    
    /// Событие нажатия на кнопку смены пароля
    @IBAction func actionPassword(_ sender: Any) {
        RNSChangePasswordController.initialController.pushAnimatedImageScroll()
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
      
    /// Настройка кнопки выхода
    func prepareBlackButton() {
        blackButton.handlerAction = { [weak self] in
            self?.showAlert()
        }
    }
}
