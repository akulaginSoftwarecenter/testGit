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
        
        let appendText:((String?)->()) = {
            guard let text = $0 else {
                return
            }
            if !(errors?.contains(text) ?? false) {
                if errors == nil {
                    errors = ""
                }else{
                    errors?.append(", ")
                }
                errors?.append(text)
            }
        }
        
        for field in self {
            var state = true
            if let text = field.errorText {
                state = false
                appendText(text)
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
