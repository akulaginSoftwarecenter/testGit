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
    
    var type: TypeTableItem = .stop
    
    func generateItemsStill() {
        itemsStill = [RNSRouteTableItem]()
        for index in 0...RNSBusStop.randCount {
            let title = RNSBusStop.randTitle(index)
            let item = RNSRouteTableItem.genBus(title)
            itemsStill.append(item)
        }
    }
    
    static func genStop(_ title: String?) -> RNSRouteTableItem {
        let stop = RNSRouteTableItem()
        stop.text1 = "\(Int.rand(1, limit: 15))" + " мин"
        stop.text2 = title
        stop.type = .stop
        return stop
    }
    
    static func genBus(_ title: String?) -> RNSRouteTableItem {
        let bus = RNSRouteTableItem()
        bus.text1 = title
        bus.type = .bus
        return bus
    }
    
    
    var stillText: String? {
        if openStill {
            return text2
        } else {
            return text1
        }
    }
}
