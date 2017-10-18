//
//  STPasswordField.swift
//  Spytricks
//
//  Created by Артем Кулагин on 29.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

/**
 Password Field
 */

class STPasswordField: RNSTextField {

    override var isValid:Bool {
        return (text?.characters.count ?? 0) >= 3
    }
    
    override var errorText:String? {
        return isValid ? nil : errorTextNoValid
    }
    
    @IBInspectable var errorTextNoValid: String = "Пароль должен состоять не менее чем из 3 символов"
    
    convenience init(placeholderKey: String) {
        self.init()
        
    }
    
    override func prepareUI() {
        
        prepareUI(placeholderKey)
        isSecureTextEntry = true
    }
}
