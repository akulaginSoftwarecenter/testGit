//
//  RNSBusTempTableModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Класс таблицы автобуса
 */
class RNSBusTableModel {
    
    var stop_points: [RNSBusStopTemp]? {
        return main?.stop_points
    }
    
    var main: RNSBusTemp?
    
    var items = [RNSBusTableItem]()
     
    var itemsStill: [RNSBusTableItem] {
        var itemsStill = [RNSBusTableItem]()
        for item in items {
             itemsStill.append(item)
            if item.isStill, item.openStill {
                itemsStill.append(contentsOf: item.itemsStill)
            }
        }
        
        itemsStill.forEach { $0.typeEdge = .none }
        itemsStill.first?.typeEdge = .start
        itemsStill.last?.typeEdge = .end

        return itemsStill
    }
    
    /// Метод инициализации 
    convenience init(_ main: RNSBusTemp?) {
        self.init()
        
        self.main = main
        prepareItems()
    }
}
