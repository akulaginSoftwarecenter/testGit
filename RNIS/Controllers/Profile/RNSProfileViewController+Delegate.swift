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
    
    /// Событие нажатия на кнопку "Ввод" на клавиатуре
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        nameField.resignFirstResponder()
        checkChange(textField)
        return true
    }
}
