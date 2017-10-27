//
//  RNSRouteParentCel.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


/// Базовая табличная ячейка для создания схемы маршрута
class RNSRouteParentCell: RNSBaseTableCell {

    /// Показать прогресс движения
    var showMove = false
    
    /// Модель схемы маршрута
    var item: RNSRouteTableItem? {
        didSet {
            prepareUI()
        }
    }
    
    /// Цвет пройденной части маршрута
    let doneColor = UIColor.A3423C
    
    /// Обновление представлений
    func prepareUI() {
        
        if showMove {
            prepareDone()
        }
    }
    
    func prepareDone() {
    
    }
    
    /// Настройка модели маршрута
    ///
    /// - Parameters:
    ///   - item: модель
    ///   - showMove: показать прогресс движения
    func prepareItem(_ item: RNSRouteTableItem?, showMove: Bool = false) {
        self.showMove = showMove
        self.item = item
    }
    
    var doneMove: Bool {
        return item?.doneMove ?? false
    }
}
