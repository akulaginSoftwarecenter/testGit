//
//  RNSSearchViewController+TextField.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для поля ввода
 */
extension RNSSearchViewController: UITextFieldDelegate {
    
    /// Событие нажатия на кнопку "Ввод" на клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    /// Метод делегата вызванный при тапе на кнопку очистки текста
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        updateSearch()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let font = textField.font else {
            return true
        }
        let isBackSpace = string == "" && range.length == 1
        if isBackSpace {
            return true
        }
        let currentWidth = (text + string).width(font)
        let allWidth = textField.frame.width - 25
        return allWidth >= currentWidth
    }
    
    
    func prepareClearColor() {
        guard let btn = textField.value(forKey: "clearButton") as? UIButton else {
            return
        }
        btn.setImage(btn.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        btn.tintColor = .color169
    }
}
