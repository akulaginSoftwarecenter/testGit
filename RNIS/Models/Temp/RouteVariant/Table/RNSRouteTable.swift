//
//  RNSRouteTable.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс таблицы маршрута
 */
class RNSRouteTable: NSObject {
    
    var items = [RNSRouteTableItem]()
    var points: [RNSRoutePoint]?
    var main: RNSRouteVariant?
    
    /// Метод инициализации 
    convenience init(_ main: RNSRouteVariant?) {
        self.init()
        
        self.main = main
        self.points = main?.points
        prepareItems()
        prepareLocationChange()
    }
    
    var itemsStill: [RNSRouteTableItem] {
        var array = [RNSRouteTableItem]()
        items.forEach {
            array.append($0)
            if $0.isStillCell, $0.openStill {
                array.append(contentsOf: $0.itemsStill)
            }
        }
        
        array.enumerateNonFirst {
            $0?.prepareTimeStopCell()
        }
        
        for i in (0..<array.count) {
            if let item = array.valueAt(i),
                item.isStillCell,
                !item.openStill,
                let nextItem = array.valueAt(i + 1) {
                let time = (nextItem.time ?? 0) + item.itemsStill.time
                nextItem.prepareTimeText1(time)
            }
        }
        
        return array
    }
    
    var lastBus: RNSBusRouteTemp?
}
