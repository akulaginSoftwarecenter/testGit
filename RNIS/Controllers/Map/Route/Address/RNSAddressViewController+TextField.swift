//
//  RNSAddressViewController+TextField.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressViewController: UITextFieldDelegate {
    
    func prepareAddress(_ text: String?) {
        textField.text = text
    }
    
    var text: String? {
       return textField.text
    }
    
    func startEdit() {
        //tableView.isHidden = false
        prepareTableView()
        buttonMyLocation.isHidden = true
    }
    
    func endEdit() {
        tableView.isHidden = true
        textField.endEditing(true)
        buttonMyLocation.isHidden = false
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        startEdit()
    }
   
    public func textFieldDidEndEditing(_ textField: UITextField) {
        prepareTableView()
        endEdit()
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        prepareTableView()
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEdit()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        prepareTableView()
        return true
    }
}
