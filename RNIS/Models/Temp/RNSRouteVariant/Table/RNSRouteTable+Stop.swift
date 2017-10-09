//
//  RNSRouteTable+Stop.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTable {
    
    func stop(_ point: RNSRoutePoint?) -> RNSRouteTableItem {
        let item = RNSRouteTableItem.genStop(point)
        item.height = 60
        item.showTopBusLine = !isLastItemRun
        item.doneMove = point?.doneMove ?? false
        return item
    }
    
    @discardableResult func appendStop(_ point: RNSRoutePoint?) -> RNSRouteTableItem {
        let item = stop(point)
        items.append(item)
        return item
    }
}
