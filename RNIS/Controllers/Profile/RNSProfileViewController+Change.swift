//
//  RNSProfileViewController+Change.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSProfileViewController {
    
    var isNameNoChange: Bool {
        return (item?.name ?? "") == (nameText ?? "")
    }
    
    var isEmailNoChange: Bool {
        let text = emailText ?? ""
        let currentEmail = (item?.email ?? "") == text
        let newEmail = (item?.new_email ?? "") == text
        return currentEmail || newEmail
    }
    
    func checkShowBtn() {
        checkShowBtnName()
        checkShowBtnEmail()
    }
    
    func checkShowBtnName() {
        galkaName.isHidden = isNameNoChange
    }
    
    func checkShowBtnEmail() {
        galkaEmail.isHidden = isEmailNoChange
    }
    
    func checkExit(handler: EmptyBlock?) {
        if !isNameNoChange || !isEmailNoChange {
            STAlertRouter.showBtns("Выйти, не сохранив изменения?") {[weak self] in
                self?.loadData()
                handler?()
            }
            return
        }
        handler?()
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
}
