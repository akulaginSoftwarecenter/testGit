//
//  RNSRouteTableItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypeTableItem {
    case stop, still, bus, total
}

class RNSRouteTableItem {
    
    var edge: Bool = false
    
    var openStill: Bool = false
    var itemsStill = [RNSRouteTableItem]()
    
    var text1: String?
    var text2: String?
    
    var height = CGFloat(73)
    
    var type: TypeTableItem = .stop
    var typeLine: TypePoint = .bus
    
    var shortLine = false
    var showLine = true
    var showTopBusLine = true
    
    var doneMove = false
    var showArrow = false
    var previousDoneMove = false

    static func genStop(_ point: RNSRoutePoint?, time: Int) -> RNSRouteTableItem {
        let stop = RNSRouteTableItem()
        stop.text1 = "\(time)" + " мин"
        stop.text2 = point?.stop_point?.name
        stop.type = .stop
        stop.typeLine = point?.type ?? .bus
        stop.doneMove = point?.doneMove ?? false
        return stop
    }
    
    static func genBus(_ title: String?) -> RNSRouteTableItem {
        let bus = RNSRouteTableItem()
        bus.text1 = title
        bus.type = .bus
        bus.height = 60
        return bus
    }
}
