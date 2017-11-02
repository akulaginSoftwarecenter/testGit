//
//  InputFieldsValidator.swift
//  TestPorocol
//
//  Created by Vlad on 28.11.16.
//  Copyright © 2016 Vlad. All rights reserved.
//

import UIKit

class InputFieldsValidator: NSObject {
    
    static var preferredPhoneFormats: [String] {
        return ["+7 (###) ###-##-##",
                "8 (###) ###-##-##",
                "(###) ###-##-##"]
    }

    static func format(_ phoneNumber: String?) -> (text: String?, haveFormat: Bool, complete: Bool) {
        
        let input = strip(phoneNumber)
        
        for format in InputFieldsValidator.preferredPhoneFormats {
            var inputIntex = 0
            var formatIndex = 0
            var temp: String? = ""
            let charactersCount = format.count
            while inputIntex < input.count && temp != nil && formatIndex < charactersCount {
                let c = format[format.index(format.startIndex, offsetBy: formatIndex)]
                let required = canBeInputByPhonePad(c)
                let next = input[input.index(input.startIndex, offsetBy: inputIntex)]
                switch c {
                case "#":
                    if next < "0" || next > "9" {
                        temp = nil
                    }
                    temp?.append(next)
                    inputIntex += 1
                default:
                    if required {
                        if next != c {
                            temp = nil;
                            break
                        }
                        temp?.append(next)
                        inputIntex += 1
                    } else {
                        temp?.append(c)
                        if next == c {
                            inputIntex += 1
                        }
                    }
                    break;
                }
                
                formatIndex += 1
            }
            if (inputIntex == input.count) {
                let complete = charactersCount == (temp?.count ?? 0)
                return (temp,true,complete)
            }
        }
        return (input,false,false)
    }
    
    static func strip(_ phoneNumber: String?) -> String {
        var res = ""
        guard let phoneNumber = phoneNumber else {
            return res
        }
        
        for index in 0..<phoneNumber.count {
            let next = phoneNumber[phoneNumber.index(phoneNumber.startIndex, offsetBy: index)]
            if canBeInputByPhonePad(next) {
                res.append(next)
            }
        }
        return res
    }
    
    static func canBeInputByPhonePad(_ c: Character) -> Bool {
        if c == "#" {
            return true
        }
        if c >= "0" && c <= "9" {
            return true
        }
        return false
    }
}
