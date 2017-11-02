//
//  InputFieldsValidator+Validation.swift
//  Solity-iOS
//
//  Created by Vlad on 29.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation

extension InputFieldsValidator
{
    static func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else {
            return false
        }
        
        let emailRegEx = "[0-9a-zA-Z._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    static func isValidPhone(_ phone: AnyObject?) -> Bool {
        guard let _phone = phone as? String else {
            return false
        }
        
        let strippedPhone = strip(_phone)
        
        return strippedPhone.count == 11
    }

    func needCustomizePhoneField(_ customize: Bool, text: String?) -> String? {
        let count = text?.count ?? 0
        var txt = text
        if count == 0 && customize {
            txt = "7"
        } else if txt == "7" && !customize {
            txt = nil
        }
        return txt
    }
}
