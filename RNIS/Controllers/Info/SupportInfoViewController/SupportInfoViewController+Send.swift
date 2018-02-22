//
//  SupportInfoViewController+Send.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с отправой данных
 */
extension SupportInfoViewController {
    
    func send() {
        if type == .feedback {
            RNSPostFeedback(contact, body: body, complete: { [weak self] item in
                self?.showAlert()
                }, failure: { [weak self] error in
                    self?.prepareError(error)
            })
        } else {
            RNSPostComplaint(contact, body: body, complete: { [weak self] item in
                self?.showAlert()
                }, failure: { [weak self] error in
                    self?.prepareError(error)
            })
        }
    }
    
    func showAlert() {
        STAlertRouter.showOk("Ваше сообщение отправлено!") { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func checkValidFields() {
        prepareError(nil)
        guard let contact = contact, !contact.isEmpty else {
            prepareError("Поле 'Почта' обязательно для заполнения.")
            return
        }
        if !InputFieldsValidator.isValidEmail(contact) {
            prepareError("Введите корректный адрес электронной почты")
            return
        }
        
        if !isValidNameSupport {
            prepareError("Поле '\(titleName ?? "")' обязательно для заполнения.")
            return
        }
        
        guard let text = messageView.text, !text.isEmptyOrWhitespace else {
            prepareError("Поле 'Текст обращения' обязательно для заполнения.")
            return
        }
        send()
    }
}
