//
//  RNSLoginViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSLoginViewController {
    
    func prepareButtons() {
        loginButton.handlerAction = {[weak self] in
            self?.loginPressed()
        }
        
        backButton.handlerAction = {
            STRouter.pop()
        }
    }
    
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
        passwordField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(doneButtonAction))
    }
    
    @objc func doneButtonAction() {
        passwordField.resignFirstResponder()
        loginPressed()
    }
    
    @objc func passwordNext() {
         passwordField.becomeFirstResponder()
    }
}
