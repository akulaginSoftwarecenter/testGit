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
    
    var itemsStill: [RNSRouteTableItem] {
        var items = [RNSRouteTableItem]()
        
        return items
    }
    
    convenience init(_ main: RNSRouteVariant?) {
        self.init()
        
        self.points = main?.points
        prepareItems()
    }
    
    func prepareItems() {
        guard let points = points else {
            return
        }
        
        items = [RNSRouteTableItem]()
        let lastIndex = points.count - 1
        for i in 0..<lastIndex {
            guard let point = points.valueAt(i),
                let busStop = point.busStop else {
                continue
            }
            appendStop(busStop.title)
            if point.isBus {
                appendBus(point.bus?.title)
                appendStill()
            }
        }
        appendStop(points.valueAt(lastIndex)?.busStop?.title)
        prepareEdge()
    }
    
    func appendStop(_ title: String?) {
        let stop = RNSRouteTableItem.genStop(title)
        items.append(stop)
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
