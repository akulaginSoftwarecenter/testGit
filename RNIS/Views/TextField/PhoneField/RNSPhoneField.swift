//
//  STLoginField.swift
//  Spytricks
//
//  Created by Артем Кулагин on 28.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

class RNSPhoneField: RNSTextField, UITextFieldDelegate {
    
    let cross = "+"
    var oldText: String?
    override var isValid:Bool {
        return format(text).complete
    }
    
    var last10:String {
        return number.last10
    }
    
    func preparePhone(_ phone: String?) {
        text = InputFieldsValidator.format(phone).text
        textFieldDidChange()
    }
    
    var handlerDidChange: EmptyBlock?
    
    override var errorText:String? {
        return isValid ? nil : "Введите корректный номер телефона"
    }
    
    var number:String {
        return InputFieldsValidator.strip(text)
    }
    
    convenience init(phone: String?) {
        self.init()
        
        preparePhone(phone)
    }
    
    required init() {
        super.init()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textFieldDidChange()
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
    
    func validPhoneSymbol(_ string: String) -> Bool {
        var set = CharacterSet(charactersIn: "1234567890")
        if text?.characters.count == 0 {
            set.insert(charactersIn: cross)
        }
        return string.trimmingCharacters(in: set).isEmpty
    }
    
    func format(_ phoneNumber: String?) -> (text: String?, haveFormat: Bool, complete: Bool) {
        return InputFieldsValidator.format(phoneNumber)
    }
}
