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
        let rect = CGRect(x: 0, y: 0, width: UIScreen.width, height: 50)
        let doneToolbar: UIToolbar = UIToolbar(frame: rect)
        doneToolbar.barStyle = .blackTranslucent
        doneToolbar.barTintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Ввод   ", style: .done, target: self, action: #selector(doneButtonAction))
        
        let items = [flexSpace,done]
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        loginField.inputAccessoryView = doneToolbar
        passwordField.inputAccessoryView = doneToolbar
     }
    
    func doneButtonAction() {
        loginField.resignFirstResponder()
        passwordField.resignFirstResponder()
        loginPressed()
    }
}
