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
        
        for i in 1..<lastIndex {
            guard let point = points.valueAt(i),
                point.stop_point != nil else {
                    continue
            }
            processingPoint(point)
        }
        appendStop(points.valueAt(lastIndex))
        prepareEdge()
        appendTotal()
        prepareFirts()
    }
    
    func processingPoint(_ point: RNSRoutePoint?) {
        guard let point = point else {
            return
        }
        
        if isNewBus(point) {
            appendBus(point)
        } else {
            let stop = self.stop(point)
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
