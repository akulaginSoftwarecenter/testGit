//
//  RNSLoginViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для настройки представлений
 */
extension RNSLoginViewController {
    
    /// Настройка кнопок
    func prepareButtons() {
        loginButton.handlerAction = {[weak self] in
            self?.loginPressed()
        }
        
        backButton.handlerAction = { [weak self] in
            self?.handlerBack?()
            STRouter.popMain()
        }
    }
    
    /// Подгрузка в текстовые поля учетных данных пользователя, если они имеются
    func prepareLoginIfNeed() {
        if let phone = item?.phone {
            prepareStart(phone, password: nil)
        } else {
            prepareStart(UserDefaults.login, password: UserDefaults.password)
        }
    }
    
    /// Заполнение полей для учетных данных
    ///
    /// - Parameters:
    ///   - phone: номера телефона
    ///   - password: пароля
    func prepareStart(_ phone: String?, password: String?) {
        loginField.preparePhone(phone)
        passwordField.text = password
    }
    
    /// Заполнение надписей для отображения ошибок
    ///
    /// - Parameter error: текст ошибки
    func  prepareError(_ error: String?) {
        guard let error = error, !error.isEmpty else {
            return
        }
        STAlertRouter.showOk(error)
    }
    
    /// Очистка надписей с ошибками
    func clearError() {
        fields.clearError()
        prepareError(nil)
    }
    
    /// Добавление на клавиатуру кнопки "Далее" для полей телефона и пароля
    func addDoneButtonOnKeyboard()  {
        loginField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(passwordNext))
        passwordField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(doneButtonAction))
    }
    
    /// Событие нажатия кнопки "Далее" в поле пароля
    @objc func doneButtonAction() {
        passwordField.resignFirstResponder()
        loginPressed()
    }
    
    /// Событие нажатия кнопки "Далее" в поле телефона
    @objc func passwordNext() {
        if showFirstErrorAlert() {
            return
        }
        passwordField.becomeFirstResponder()
    }
}
