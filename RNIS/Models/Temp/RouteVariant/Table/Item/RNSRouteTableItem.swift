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

/**
 Класс таблицы маршрута
 */
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
    
    var time: Int?
    
    var handlerUpdateText1: EmptyBlock?
    var point: RNSRoutePoint?
    
    static func genStop(_ point: RNSRoutePoint?, time: Int) -> RNSRouteTableItem {
        let item = RNSRouteTableItem()
        item.point = point
        item.time = time
        item.text2 = point?.title
        item.type = .stop
        item.typeLine = point?.type ?? .bus
        return item
    }
    
    func prepareText2(_ point: RNSRoutePoint?) {
        if let name = point?.stop_point?.name {
            text2 = name
        } else if let name = point?.name  {
            text2 = name
        }
    }
    
    static func genBus(_ title: String?) -> RNSRouteTableItem {
        let bus = RNSRouteTableItem()
        bus.text1 = title
        bus.type = .bus
        bus.height = 60
        return bus
    }
    
    func prepareTimeStopCell() {
        if isStopCell {
            prepareTimeText1(time)
        }
    }
    
    func prepareTimeText1(_ time: Int?) {
        text1 = "\(time ?? 0)" + " мин"
        handlerUpdateText1?()
    }
    
    func defaultDoneMove() {
        doneMove = point?.doneMove ?? false
        previousDoneMove = false
    }
}
