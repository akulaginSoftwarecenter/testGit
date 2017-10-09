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
        
        processingPoint(points.first)
        let lastIndex = points.count - 1
        guard 1 <= lastIndex  else {
            return
        }
        var lastBus: RNSBusRouteTemp?
        for i in 1..<lastIndex {
            guard let point = points.valueAt(i),
                point.stop_point != nil else {
                    continue
            }
            processingPoint(point, lastBus: lastBus)
            if let route = point.route {
                lastBus = route
            }
        }
        appendStop(points.valueAt(lastIndex))
        prepareEdge()
        appendTotal()
        prepareFirts()
    }
    
    func processingPoint(_ point: RNSRoutePoint?, lastBus: RNSBusRouteTemp? = nil) {
        guard let point = point else {
            return
        }
        var isNewBus = false
        if let bus = point.route, lastBus != bus  {
            isNewBus = true
        }
        
        if isNewBus {
            let stop = self.appendStop(point)
            stop.shortLine = true
            let item = RNSRouteTableItem.genBus(point.route?.title)
            items.append(item)
        } else {
            let stop = self.stop(point)
            if isLastStop {
                lastItem?.prepareStill()
            }
            
            if isLastStill {
                lastItem?.appendStillItem(stop)
            } else {
                items.append(stop)
            }
        }
        
    }
    
    func stop(_ point: RNSRoutePoint?) -> RNSRouteTableItem {
        let item = RNSRouteTableItem.genStop(point)
        item.height = 60
        item.showTopBusLine = !isLastItemRun
        return item
    }
    
    @discardableResult func appendStop(_ point: RNSRoutePoint?) -> RNSRouteTableItem {
        let item = stop(point)
        items.append(item)
        return item
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
        item.text1 = "Итого: \(main?.time ?? 0) мин."
        item.type = .total
        items.append(item)
    }
    
    func prepareFirts() {
        items.first?.showTopBusLine = false
    }
}
