//
//  RNSRouteTable+Stop.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с остановкой
 */
extension RNSRouteTable {
    
    func stop(_ point: RNSRoutePoint?, time: Int) -> RNSRouteTableItem {
        let item = RNSRouteTableItem.genStop(point, time: time)
        item.height = 60
        item.showTopBusLine = !isLastItemRun
        return item
    }
    
    @discardableResult func appendStop(_ point: RNSRoutePoint?, time: Int) -> RNSRouteTableItem {
        let item = stop(point, time: time)
        items.append(item)
        return item
    }
}
