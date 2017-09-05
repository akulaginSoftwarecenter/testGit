//
//  RNSBusDetailWayCell+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusDetailWayCell {
    var isStart: Bool {
        return typeEdge == .start
    }
    
    var isEnd: Bool {
        return typeEdge == .end
    }
    
    var isEdge: Bool {
        return isStart || isEnd
    }
    
    var isDef: Bool {
        return type == .def
    }
    
    var isStill: Bool {
        return type == .still
    }
    
    var isCurrent: Bool {
        return type == .current
    }
   
    var type: TypeBusTableItem {
        return item?.type ?? .def
    }
    
    var typeEdge: TypeEdgeBusItem {
        return item?.typeEdge ?? .none
    }
    
    var isOpenStill: Bool {
        return item?.openStill ?? false
    }
}
