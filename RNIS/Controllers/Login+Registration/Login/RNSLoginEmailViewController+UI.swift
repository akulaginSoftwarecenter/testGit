//
//  RNSLoginEmailViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Расширение для настройки представлений
 */
extension RNSLoginEmailViewController {
    
    /// Подгрузка в текстовые поля учетных данных пользователя, если они имеются
    /*
    func prepareLoginIfNeed() {
        if let email = item?.email {
            prepareStart(email, password: nil)
        } else {
            prepareStart(UserDefaults.login, password: UserDefaults.password)
        }
    }
    */
    /// Заполнение полей для учетных данных
    ///
    /// - Parameters:
    ///   - phone: номера телефона
    ///   - password: пароля
    func prepareStart(_ email: String?, password: String?) {
        loginField.text = email
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
