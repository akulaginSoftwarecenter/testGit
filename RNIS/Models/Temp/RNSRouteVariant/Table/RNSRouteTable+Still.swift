//
//  RNSRouteTable+Still.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTable {
    
    var itemsStill: [RNSRouteTableItem] {
        var itemsStill = [RNSRouteTableItem]()
        for item in items {
            itemsStill.append(item)
            if item.isStill, item.openStill {
                itemsStill.append(contentsOf: item.itemsStill)
            }
        }
        return itemsStill
    }
    
    func appendStill() {
        let item = RNSRouteTableItem()
        item.type = .still
        item.generateItemsStill()
        item.text1 = "Еще \(item.countStill)"
        item.text2 = "Свернуть"
        items.append(item)
    }
}
