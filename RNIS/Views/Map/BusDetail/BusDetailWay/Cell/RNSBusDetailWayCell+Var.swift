//
//  RNSBusDetailWayCell+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Bus Detail Way Cell Var
 */
extension RNSBusDetailWayCell {
    /// переменная если ячейка стартовая
    var isStart: Bool {
        return typeEdge == .start
    }
    /// переменная если ячейка конечная
    var isEnd: Bool {
        return typeEdge == .end
    }
    /// переменная если ячейка края
    var isEdge: Bool {
        return isStart || isEnd
    }
    /// переменная если ячейка обычная
    var isDef: Bool {
        return type == .def
    }
    /// переменная если ячейка "Еще"
    var isStill: Bool {
        return type == .still
    }
    /// переменная если ячейка текущая
    var isCurrent: Bool {
        return type == .current
    }
    /// переменная типа ячейки
    var type: TypeBusTableItem {
        return item?.type ?? .def
    }
    /// переменная типа края
    var typeEdge: TypeEdgeBusItem {
        return item?.typeEdge ?? .none
    }
    /// переменная открытия "Еще"
    var isOpenStill: Bool {
        return item?.openStill ?? false
    }
}
