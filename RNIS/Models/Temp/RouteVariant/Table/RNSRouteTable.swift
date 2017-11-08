//
//  RNSRouteTable.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteTable: NSObject {
    
    var items = [RNSRouteTableItem]()
    var points: [RNSRoutePoint]?
    var main: RNSRouteVariant?
    
    convenience init(_ main: RNSRouteVariant?) {
        self.init()
        
        self.main = main
        self.points = main?.points
        prepareDoneLocation()
        //randomDoneMove()
        prepareItems()
        prepareMove()
    }
    
    var itemsStill: [RNSRouteTableItem] {
        var itemsStill = [RNSRouteTableItem]()
        for item in items {
            itemsStill.append(item)
            if item.isStillCell, item.openStill {
                itemsStill.append(contentsOf: item.itemsStill)
            }
        }
        return itemsStill
    }
    
    var lastBus: RNSBusRouteTemp?
}