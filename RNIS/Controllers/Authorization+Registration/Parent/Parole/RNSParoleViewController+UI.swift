//
//  RNSParoleViewController+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSParoleViewController extention
 */

extension RNSParoleViewController {
    
    func prepareUI() {
        preparePlaceholderPassworOne()
        prepareTitleBlackButton()
    }
    
    func preparePlaceholderPassworOne() {
        guard let placeholderPassworOne = placeholderPassworOne else {
            return
        }
        passwordOneField.placeholderKey = placeholderPassworOne
    }
    
    func prepareTitleBlackButton() {
        guard let titleBlackButton = titleBlackButton else {
            return
        }
        coverView.titleBlackButton = titleBlackButton
    }

    func addDoneButtonOnKeyboard()  {
        passwordOneField.addButtonOnKeyboard("Далее   ", target: passwordTwoField, action: #selector(UIResponder.becomeFirstResponder))
        passwordTwoField.addButtonOnKeyboard("Далее   ", target: self, action: #selector(self.loginPressed))
    }
}
