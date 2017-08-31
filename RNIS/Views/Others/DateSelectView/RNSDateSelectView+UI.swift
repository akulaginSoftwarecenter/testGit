//
//  RNSDateSelectView+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSDateSelectView {
    
    func prepareUI() {
        prepareButton()
        prepareDatePicker()
    }
    
    func prepareButton() {
        oKButton.handlerAction = {[weak self] in
            self?.hidden()
            self?.handlerDate?(self?.datePicker.date)
        }
        
        cancelButton.handlerAction = {[weak self] in
            self?.hidden()
        }
    }
    
    func hidden() {
        isHidden = true
    }
    
    func prepareDatePicker() {
        datePicker.minimumDate = Date()
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
    }
}
