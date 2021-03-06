//
//  RNSRouteTable+Bus.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с автобусами
 */
extension RNSRouteTable {
    
    func appendBus(_ point: RNSRoutePoint?, time: Int) {
        let stop = self.appendStop(point, time: time)
        stop.shortLine = true
        let item = RNSRouteTableItem.genBus(point?.route?.title)
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
