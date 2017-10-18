//
//  RNSLoginField.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Login Field
 */

class RNSNameField: RNSTextField, UITextFieldDelegate {

    convenience init(text: String?) {
        self.init()
        
        self.text = text
    }
    
    required init() {
        super.init()
        
        prepareDelegate()
    }
    
    func prepareDelegate() {
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        prepareDelegate()
    }
    
    func validText(_ string: String) -> Bool {
        let set = CharacterSet(charactersIn: "/;:\"\'{}[]<>^?, .")
        return !string.trimmingCharacters(in: set).isEmpty
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return validateSpecialCharactor(string)
    }
    
    func validateSpecialCharactor(_ text: String?) -> Bool {
        let pred = NSPredicate(format: "SELF MATCHES %@", "[А-Я а-яA-Za-z0-9^]*")
        return pred.evaluate(with:text)
    }

}
