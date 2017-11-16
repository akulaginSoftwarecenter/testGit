//
//  RNSSearchViewController+TextField.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        updateSearch()
        return true
    }
    
    func prepareClearColor() {
        guard let btn = textField.value(forKey: "clearButton") as? UIButton else {
            return
        }
        btn.setImage(btn.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        btn.tintColor = .color169
    }
}
