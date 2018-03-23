//
//  RNSTextItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Протокол для текста
 */
protocol RNSTextItem: class {
    /// переменная имени сущности
    var name: String? { get set }
    
    /// функция расчет высоты в зависимости от ширины
    func heightAtWidth(_ width: CGFloat) -> CGFloat

}
