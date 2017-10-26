//
//  RNSProfileViewController+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 19.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation


/// Расширение для работы с текстовыми полями
extension RNSProfileViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        nameField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkChange(textField)
    }
    
    /// Обновление информации на сервере после редактирования соответствующего поля
    ///
    /// - Parameter textField: текстовое поля
    func checkChange(_ textField: UITextField) {
        if  textField == nameField {
            changeName()
        } else if  textField == emailField {
            changeEmail()
        }
    }
    
    /// Обновление имени в модели и на сервере
    func changeName() {
        let text = nameField.text
        if text == item?.name {
            return
        }
        item?.name = text
        updateItem()
    }
    
    /// Обновление почты в модели и на сервере
    func changeEmail() {
        prepareError(nil)
        if let error = [emailField].checkValidFields {
            prepareError(error)
            return
        }
        
        let text = emailField.text
        if text == item?.email {
            return
        }
  
        item?.new_email = text
        updateItem({ [weak self] in
            self?.showAlertOk("Для завершения изменения адреса почты перейдите по ссылке в письме")
        })
    }
    
    /// Отправка на сервер изменений в модели профиля
    ///
    /// - Parameter complete: блок завершения операции отправки
    func updateItem(_ complete: EmptyBlock? = nil) {
        STRouter.showLoader()
        RNSPostUpdate(item, complete: { [weak self] item in
           self?.item?.new_email = nil  // Don't re-send new email parameter on next update profile request
           STRouter.removeLoader()
           RNSMenuManager.leftMenuUpdate()
           complete?()
        }, failure: {[weak self]  error in
            STRouter.removeLoader()
            self?.showAlertOk(error)
        })
    }
    
    /// Показать алерт с указанным текстом
    ///
    /// - Parameter message: текст
    func showAlertOk(_ message: String?) {
        STRouter.showAlertOk(message)
    }
    
    func prepareError(_ error: String?) {
        errorLabel.text = error
    }
}
