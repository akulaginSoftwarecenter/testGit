//
//  Array+STPlayer.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension Array where Element : RNSTextField {
    
    var checkValidFields: String? {
        var errors:String?
        for field in self {
            var state = true
            if let text = field.errorText {
                state = false
                if errors == nil {
                    errors = ""
                }else{
                    errors?.append(", ")
                }
                errors?.append(text)
            }
            field.setState(state)
        }
        return errors
    }
    
    func clearError() {
        for field in self {
            field.setStateValid()
        }
    }
}
