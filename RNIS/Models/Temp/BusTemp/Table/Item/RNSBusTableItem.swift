//
//  RNSBusTableItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypeBusTableItem {
    case def, still, current
}

enum TypeEdgeBusItem {
    case start, none, end
}

class RNSBusTableItem {
    
    var typeEdge: TypeEdgeBusItem = .none
    
    var type: TypeBusTableItem = .def
    var title: String?
    
    var itemsStill = [RNSBusTableItem]()
    var openStill: Bool = false
    var stop: RNSBusStopTemp?
    
    var dict: AliasDictionary? {
        return stop?.toJSON()
    }
    
    /// Метод инициализации 
    init(_ stop: RNSBusStopTemp? = nil, type: TypeBusTableItem = .def, typeEdge: TypeEdgeBusItem = .none) {
        self.type = type
        title = stop?.name
        self.stop = stop
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
        typeEdge = .start
    }
    
    var titleTemp: String? {
        return isStill ? stillText : title
    }
}

