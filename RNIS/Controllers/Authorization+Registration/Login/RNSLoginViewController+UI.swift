//
//  RNSLoginViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSLoginViewController {
    
    func prepareLoginIfNeed() {
        if let phone = item?.phone {
            prepareStart(phone, password: nil)
        } else {
            prepareStart(UserDefaults.login, password: UserDefaults.password)
        }
    }
    
    func prepareStart(_ phone: String?, password: String?) {
        loginField.preparePhone(phone)
        passwordField.text = password
    }
    
    func  prepareError(_ error: String?) {
        errorLabel.text = error
    }
    
    func clearError() {
        fields.clearError()
        errorLabel.text = nil
    }
    
    func addDoneButtonOnKeyboard()  {
        loginField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(passwordNext))
        passwordField.addButtonOnKeyboard("Ввод   ", target: self, action: #selector(doneButtonAction))
    }
    
    func doneButtonAction() {
        passwordField.resignFirstResponder()
        loginPressed()
    }
    
    func passwordNext() {
         passwordField.becomeFirstResponder()
    }
}
