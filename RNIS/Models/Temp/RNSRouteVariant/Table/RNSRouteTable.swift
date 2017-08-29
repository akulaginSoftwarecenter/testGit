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
    
    convenience init(_ main: RNSRouteVariant?) {
        self.init()
        
        self.points = main?.points
        prepareItems()
    }
    
    func prepareItems() {
        items = [RNSRouteTableItem]()
        for point in points ?? [] {
            let stop = RNSRouteTableItem.genStop(point.busStop?.title)
            if point.isBus {
                appendBus(point.bus?.title)
                appendStill()
            }
            items.append(stop)
        }
        
        prepareEdge()
    }
    
    func appendBus(_ title: String?) {
        let item = RNSRouteTableItem.genBus(title)
        items.append(item)
    }
    
    func appendStill() {
        let item = RNSRouteTableItem()
        item.type = .still
        item.generateItemsStill()
        item.text1 = "Еще \(item.itemsStill.count)"
        item.text2 = "Свернуть"
        items.append(item)
    }
    
    func prepareEdge() {
        let first = items.first
        first?.edge = true
        first?.text1 = "Старт"
        items.last?.edge = true
        
        let item = RNSRouteTableItem()
        item.text1 = "Итого: 36 мин."
        item.type = .total
        items.append(item)
    }
}
