//
//  STLoginField.swift
//  Spytricks
//
//  Created by Артем Кулагин on 28.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

/**
 Текстовое поля для ввода номера телефона
 */
class RNSPhoneField: RNSTextField, UITextFieldDelegate {
    
    let cross = "+"
    var oldText: String?
    override var isValid:Bool {
        return format(text).complete
    }

    /// Последние 10 символов номера
    var last10:String {
        return number.last10
    }
    
    /// Обработка текста номера телефона
    ///
    /// - Parameter phone: номер телефона
    func preparePhone(_ phone: String?) {
        guard let phone = phone else {
            return
        }
        text = InputFieldsValidator.format(phone).text
        textFieldDidChange()
    }
    
    /// блок изменения текста
    var handlerDidChange: EmptyBlock?
    
    override var errorText:String? {
        return isValid ? nil : "Введите корректный номер телефона"
    }
    
    /// Номер телефона
    var number:String {
        return InputFieldsValidator.strip(text)
    }
    
    /// Создание поля
    ///
    /// - Parameter phone: номер телефона
    convenience init(phone: String?) {
        self.init()
        
        preparePhone(phone)
    }
    
    /// Метод инициализации класса
    required init() {
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareUI() {
        prepareUI("Введите номер телефона")
        
        keyboardType = .phonePad
        delegate = self
        editingChanged {[weak self] in
            self?.textFieldDidChange()
        }
    }
    /// Метод делегата вызванный при старте редактирования текстового поля
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if text == "" {
            text = "+7"
        }
    }
    /// Метод делегата вызванный при окончании редактирования текстового поля
    func textFieldDidEndEditing(_ textField: UITextField) {
        if text == "+7" {
            text = ""
        }
    }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !validPhoneSymbol(string) {
            return false
        }
        
        if string == cross {
            textField.text = "+7"
            return false
        }
        return true
    }
    
    /// Выполнение действий в ответ на изменение поля
    func textFieldDidChange() {
        let form = format(text)
        if form.haveFormat {
            let value = form.text
            text = value
            oldText = value
        }else{
            text = oldText
        }
        if text?.isEmpty ?? true  {
            text = "+7"
        }
        handlerDidChange?()
    }
    
    /// Валидация текста
    ///
    /// - Parameter string: текст
    /// - Returns: валидный/не валидный
    func validPhoneSymbol(_ string: String) -> Bool {
        var set = CharacterSet(charactersIn: "1234567890")
        if text?.count == 0 {
            set.insert(charactersIn: cross)
        }
        return string.trimmingCharacters(in: set).isEmpty
    }
    
    func format(_ phoneNumber: String?) -> (text: String?, haveFormat: Bool, complete: Bool) {
        return InputFieldsValidator.format(phoneNumber)
    }
}
