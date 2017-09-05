//
//  RNSBusTempTableModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

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
        return itemsStill
    }
    
    convenience init(_ main: RNSBusTemp?) {
        self.init()
        
        self.main = main
        prepareItems()
    }
}
