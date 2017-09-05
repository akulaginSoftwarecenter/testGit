//
//  RNSBusTableItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypeBusTableItem {
    case start, def, still, current, end
}

class RNSBusTableItem {
    var type: TypeBusTableItem = .def
    var title: String? = ""
    
    var itemsStill = [RNSBusTableItem]()
    var openStill: Bool = false
    
    init(_ stop: RNSBusStopTemp? = nil, type: TypeBusTableItem) {
        self.type = type
        title = stop?.name
    }
    
    static func itemDef(_ stop: RNSBusStopTemp?) -> RNSBusTableItem {
        return  RNSBusTableItem(stop, type: .def)
    }
    
    static func itemStill(_ title: String?, itemsStill: [RNSBusTableItem]) -> RNSBusTableItem {
        let item = RNSBusTableItem(type: .still)
        item.itemsStill = itemsStill
        item.title = title
        return item
    }
    
    func prepareStart() {
        type = .start
    }
}

