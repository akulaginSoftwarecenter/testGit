//
//  RNSDateSelectView+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с представлениями
 */
extension RNSDateSelectView {
    
    /// Настройка представлений
    func prepareUI() {
        prepareButton()
        prepareDatePicker()
    }
    
    /// Настройка кнопок
    func prepareButton() {
        oKButton.handlerAction = {[weak self] in
            self?.hidden()
            self?.handlerDate?(self?.datePicker.date)
        }
        
        cancelButton.handlerAction = {[weak self] in
            self?.hidden()
        }
    }
    
    /// функция исчезновения вью
    func hidden() {
        isHidden = true
    }
    
    /// Настройка пикера
    func prepareDatePicker() {
        datePicker.minimumDate = Date()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
}
