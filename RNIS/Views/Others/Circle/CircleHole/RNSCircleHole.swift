//
//  RNSCircleHole.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление круга внутри круга
 */
class RNSCircleHole: BaseViewWithXIBInit {
    
    /// Внешний круг
    @IBOutlet var mainCircle: RNSCircle!
    /// Внутренний круг
    @IBOutlet weak var smallCircle: RNSCircle!
    
    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    /// метод загрузки названия xib файла
    override var nibNamed:String {
        return "RNSCircleHole"
    }
}
