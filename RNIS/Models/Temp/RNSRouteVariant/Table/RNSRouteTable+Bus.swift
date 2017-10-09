//
//  RNSRouteTable+Bus.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTable {
    
    func appendBus(_ point: RNSRoutePoint?) {
        let stop = self.appendStop(point)
        stop.shortLine = true
        let item = RNSRouteTableItem.genBus(point?.route?.title)
        //item.doneMove = point?.doneMove ?? false
        items.append(item)
    }
    
    func prepareLastBus(_ point: RNSRoutePoint?) {
        if let route = point?.route {
            lastBus = route
        }
    }
    
    func isNewBus(_ point: RNSRoutePoint?) -> Bool {
        var isNew = false
        if let bus = point?.route, lastBus != bus  {
            isNew = true
        }
        return isNew
    }
}
