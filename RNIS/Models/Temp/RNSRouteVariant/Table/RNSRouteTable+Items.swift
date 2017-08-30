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
                let busStop = point.busStop else {
                    continue
            }
            
            let stop = appendStop(busStop.title, typeLine: point.type)
            if point.isBus {
                stop.shortLine = true
                appendBus(point.bus?.title)
                appendStill()
            }
        }
        let lastItem = points.valueAt(lastIndex)
        appendStop(lastItem?.busStop?.title, typeLine: lastItem?.type)
        prepareEdge()
        appendTotal()
    }
    
    @discardableResult func appendStop(_ title: String?, typeLine: TypePoint?) -> RNSRouteTableItem {
        let item = RNSRouteTableItem.genStop(title, typeLine: typeLine)
        item.height = 60
        items.append(item)
        return item
    }
    
    func appendBus(_ title: String?) {
        let item = RNSRouteTableItem.genBus(title)
        items.append(item)
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
}
