//
//  RNSRouteTable+Still.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTable {
    
    func prepareItems() {
        guard let points = points else {
            return
        }
        
        items = [RNSRouteTableItem]()
        let lastIndex = points.count - 1
        for i in 0..<lastIndex {
            guard let point = points.valueAt(i),
                point.stop_point != nil else {
                    continue
            }
            
            let stop = appendStop(point)
            if point.isBus {
                stop.shortLine = true
                appendBus(point.route?.title)
                appendStill()
            }
        }
        appendStop(points.valueAt(lastIndex))
        prepareEdge()
        appendTotal()
        prepareFirts()
    }
    
    @discardableResult func appendStop(_ point: RNSRoutePoint?) -> RNSRouteTableItem {
        let item = RNSRouteTableItem.genStop(point)
        item.height = 60
        item.showTopBusLine = !isLastItemRun
        items.append(item)
        return item
    }
    
    func appendBus(_ title: String?) {
        let item = RNSRouteTableItem.genBus(title)
        items.append(item)
    }
    
    var isLastItemRun: Bool {
        return items.last?.isRun ?? false
    }
    
    func prepareEdge() {
        let first = items.first
        first?.edge = true
        first?.text1 = "Старт"
        first?.height = 80
        
        
        let last = items.last
        last?.edge = true
        last?.height = 33
        last?.showLine = false
    }
    
    func appendTotal() {
        let item = RNSRouteTableItem()
        item.text1 = "Итого: 36 мин."
        item.type = .total
        items.append(item)
    }
    
    func prepareFirts() {
        items.first?.showTopBusLine = false
    }
}
