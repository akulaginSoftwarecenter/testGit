//
//  RNSRouteTableItem+Copying.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с протоколом NSCopying
 */
extension RNSRouteTableItem: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = RNSRouteTableItem()
        copy.edge = edge
        copy.time = time
        copy.openStill = openStill
        copy.itemsStill = itemsStill
        copy.text1 = text1
        copy.text2 = text2
        copy.height = height
        copy.type = type
        copy.typeLine = typeLine
        copy.shortLine = shortLine
        copy.showLine = showLine
        copy.showTopBusLine = showTopBusLine
        copy.point = point
        copy.doneMove = doneMove
        return copy
   }
}
