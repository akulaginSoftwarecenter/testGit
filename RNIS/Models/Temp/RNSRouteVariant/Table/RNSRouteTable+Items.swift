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
        points.enumerateRange(1..<lastIndex) { (point) in
            guard let point = point,
                point.isHaveStop else {
                return
            }
            self.processingPoint(point)
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
