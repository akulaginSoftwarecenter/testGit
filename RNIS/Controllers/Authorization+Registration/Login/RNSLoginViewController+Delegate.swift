//
//  RNSLoginViewController+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для обработки событий текстовых полей
 */
extension RNSLoginViewController: UITextFieldDelegate {
    
    /// Событие нажатия на кнопку "Ввод" на клавиатуре
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordField {
            doneButtonAction()
        }
        return true
    }
}
