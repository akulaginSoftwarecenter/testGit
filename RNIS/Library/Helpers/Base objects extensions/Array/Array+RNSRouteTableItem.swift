//
//  Array+RNSRouteTableItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension Array where Element: RNSRouteTableItem {
    func prepareMove() {
        for i in 0..<count - 1 {
            
            guard let item = valueAt(i) else {
                continue
            }
            let nextItem = valueAt(i + 1)
            let previousItem = valueAt(i - 1)
            
            if item.doneMove {
                nextItem?.previousDoneMove = true
            }
            if item.isBusCell {
                item.doneMove = item.previousDoneMove
            }
            if item.isStillCell, previousItem?.doneMove ?? false {
                item.doneMove = true
                let itemsStill = item.itemsStill
                itemsStill.first?.previousDoneMove = true
                itemsStill.prepareMove()
                
                nextItem?.previousDoneMove = item.lastStillDoneMove
            }
        }
    }
}
