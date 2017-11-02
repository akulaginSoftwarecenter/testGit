//
//  RNSCodeViewController+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для обработки событий текстовых полей
 */
extension RNSCodeViewController: UITextFieldDelegate {
    
    /// Событие зажигается перед любым изменением текста поля пользователем.
    /// Обработчик разрешает ввод не более 4 символов.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 4 // Bool
    }
}
