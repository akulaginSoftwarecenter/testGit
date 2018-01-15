//
//  RNSParoleViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSParoleViewController extention
 */

extension RNSParoleViewController {
    
    /// Подготовка представлений
    func prepareUI() {
        preparePlaceholderPassworOne()
        prepareTitleBlackButton()
    }
    
    /// Подготовка заполнителя для поля пароля
    func preparePlaceholderPassworOne() {
        guard let placeholderPassworOne = placeholderPassworOne else {
            return
        }
        passwordOneField.placeholderKey = placeholderPassworOne
    }
    
    /// Подготовка заголовка для кнопки перехода к следующему шагу
    func prepareTitleBlackButton() {
        guard let titleBlackButton = titleBlackButton else {
            return
        }
        coverView.titleBlackButton = titleBlackButton
    }

    /// Добавление кнопки "Далее" на клавиатуру полей
    func addDoneButtonOnKeyboard()  {
        passwordOneField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(self.passworOneAction))
        passwordTwoField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(self.loginPressed))
    }
    
    @objc func passworOneAction() {
        if showFirstErrorAlert() {
            return
        }
        passwordTwoField.becomeFirstResponder()
    }
}
