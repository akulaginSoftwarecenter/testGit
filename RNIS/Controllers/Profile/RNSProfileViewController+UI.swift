//
//  RNSProfileViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSProfileViewController {
    
    /// Очистка представлений
    func clearAll() {
        profilePhoto.imageView.image = nil
        nameField.text = ""
        phoneField.text = ""
        emailField.text = ""
        errorLabel.text = ""
    }
     
    /// Обновление представлений
    ///
    /// - Parameter item: модель профиля
    func updateUI(_ item: RNSUserPayload?) {
        self.item = item
        nameField.text = item?.name
        phoneField.text = item?.formatPhone
        emailField.text = item?.email
        
        decodeImage()
    }
    
    func checkShowBtn() {
        checkShowBtnName()
        checkShowBtnEmail()
    }
    
    func checkShowBtnName() {
        galkaName.isHidden = (item?.name ?? "") == (nameText ?? "")
    }
    
    func checkShowBtnEmail() {
        let text = emailText ?? ""
        let currentEmail = (item?.email ?? "") == text
        let newEmail = (item?.new_email ?? "") == text
        galkaEmail.isHidden = currentEmail || newEmail
    }
    
    /// Обновление информации на сервере после редактирования соответствующего поля
    ///
    /// - Parameter textField: текстовое поля
    func checkChange(_ textField: UITextField) {
        if  textField == nameField {
            changeNameIfNeed()
        } else if  textField == emailField {
            changeEmailIfNeed()
        }
    }
    
    /// Обновление имени в модели и на сервере
    func changeNameIfNeed() {
        if nameText == item?.name {
            return
        }
        item?.name = nameText
        updateItem { [weak self] in
            self?.checkShowBtn()
        }
    }
    
    /// Обновление почты в модели и на сервере
    func changeEmailIfNeed() {
        prepareError(nil)
        if let error = [emailField].checkValidFields {
            prepareError(error)
            return
        }
        
        if emailText == item?.email {
            return
        }
        
        updateItem(email: emailText){ [weak self] in
            self?.showAlertOk("Для завершения изменения адреса почты перейдите по ссылке в письме")
            self?.checkShowBtn()
        }
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
