//
//  RNSCircleRed.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Круг
 */
class RNSCircle: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        prepareCircle()
    }
    
    /// Настройка цвета для состояния "выполнено"
    func prepareDone() {
        backgroundColor = .A3423C
    }
    
    /// Настройка цвета для состояния "не выполнено"
    func prepareUnDone() {
        backgroundColor = .white
    }
}
