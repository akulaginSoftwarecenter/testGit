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
        var time = 0
        points.enumerateRange(1..<lastIndex) { (point) in
            guard let point = point else {
                return
            }
            time += point.time ?? 0
            guard point.isHaveStop else {
                return
            }
            self.processingPoint(point, time: time)
            time = 0
        }
        prepareLast(time)
        prepareEdge()
        appendTotal()
        prepareFirts()
    }
    
    func prepareLast(_ time: Int) {
        let last = points?.last
        let time = time + (last?.time ?? 0)
        appendStop(last, time: time)
    }
    
    func processingPoint(_ point: RNSRoutePoint?, time: Int = 0) {
        guard let point = point else {
            return
        }
        
        if isNewBus(point) {
            appendBus(point, time: time)
        } else {
            let stop = self.stop(point, time: time)
            prepareStillIfNeed()
            
            if isLastStill {
                lastItem?.appendStillItem(stop)
            } else {
                items.append(stop)
            }
        }
        prepareLastBus(point)
    }
}
