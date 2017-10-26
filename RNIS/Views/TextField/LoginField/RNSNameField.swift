//
//  RNSLoginField.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Текстовое поле для ввода логина
 */
class RNSNameField: RNSTextField, UITextFieldDelegate {

    /// Создание поля
    ///
    /// - Parameter text: текст
    convenience init(text: String?) {
        self.init()
        
        self.text = text
    }
    
    required init() {
        super.init()
        
        prepareDelegate()
    }
    
    /// Настройка делегата поля
    func prepareDelegate() {
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        prepareDelegate()
    }
    
    /// Проверка текста на валидность
    ///
    /// - Parameter string: текст
    /// - Returns: булевое значение валидности
    func validText(_ string: String) -> Bool {
        let set = CharacterSet(charactersIn: "/;:\"\'{}[]<>^?, .")
        return !string.trimmingCharacters(in: set).isEmpty
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return validateSpecialCharactor(string)
    }
    
    /// Проверка текста на содержание специальных символов
    ///
    /// - Parameter text: текст
    /// - Returns: <#return value description#>
    func validateSpecialCharactor(_ text: String?) -> Bool {
        let pred = NSPredicate(format: "SELF MATCHES %@", "[А-Я а-яA-Za-z0-9^]*")
        return pred.evaluate(with:text)
    }

}
