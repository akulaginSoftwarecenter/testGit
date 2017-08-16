//
//  RNSAddressViewController+TextField.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressViewController: UITextFieldDelegate {
    
    var text: String? {
       return textField.text
    }
    
    func startEdit() {
        buttonMyLocation.isHidden = true
    }
    
    func endEdit() {
        textField.endEditing(true)
        buttonMyLocation.isHidden = false
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        startEdit()
    }
   
    public func textFieldDidEndEditing(_ textField: UITextField) {
        endEdit()
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEdit()
        return true
    }
}
