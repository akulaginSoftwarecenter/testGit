//
//  RNSLoginEmailViewController+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для обработки событий текстовых полей
 */
extension RNSLoginEmailViewController {
    /// Событие нажатия на кнопку "Ввод" на клавиатуре
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordField {
            doneButtonAction()
        }
        return true
    }
}
