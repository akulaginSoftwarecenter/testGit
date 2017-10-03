//
//  RNSNoteRoute+UI.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSNoteRoute {
    
    func prepareUIBus() {
        titleLabel.font = .cffazm20
        titleLabel.textColor = .white
        
        prepareColor(.A3423C)
    }
     
    func prepareMinute() {
        titleLabel.font = .cffazm18
        titleLabel.textColor = .backColor
        
        prepareColor(.white)
    }
    
    func prepareColor(_ color: UIColor) {
        backView.backgroundColor = color
        
        leftView.backgroundColor = color
        upView.backgroundColor = color
        rightView.backgroundColor = color
        downView.backgroundColor = color
    }
}
