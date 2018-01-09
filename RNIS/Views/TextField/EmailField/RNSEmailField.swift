//
//  RNSEmailField.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Текстовое поле для ввода почты
 */
class RNSEmailField: RNSTextField {

    override var isValid:Bool {
        return InputFieldsValidator.isValidEmail(text)
    }
    
    override var errorText:String? {
        return isValid ? nil : kErrorMail
    }
    
    /// Создание поля
    ///
    /// - Parameter email: текст электронного адреса почты
    convenience init(email: String?) {
        self.init()
        text = email
    }
    
    required init() {
        super.init()
 
        prepareKeyBoard()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareUI() {
        prepareUI("Электронная почта")
    }
    
    func prepareKeyBoard() {
        keyboardType = .emailAddress
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareKeyBoard()
    }
}
