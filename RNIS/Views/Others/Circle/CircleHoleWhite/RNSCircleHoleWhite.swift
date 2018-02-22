//
//  RNSCircleHoleWhite.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление круга внутри круга с белым внутренним кругом
 */
class RNSCircleHoleWhite: RNSCircleHole {

    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareDefaut()
        smallCircle.backgroundColor = .white
    }
    
    var doneMove: Bool = false {
        didSet {
            if doneMove == true {
                prepareDone()
            } else {
                prepareDefaut()
            }
        }
    }
    
    func prepareDone() {
        mainCircle.prepareDone()
    }
    
    /// Настройка внешнего круга
    func prepareDefaut() {
        mainCircle.backgroundColor = .FFB9AF
    }
}
