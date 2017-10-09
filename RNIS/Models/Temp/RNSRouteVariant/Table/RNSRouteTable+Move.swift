//
//  RNSRouteTable+Move.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRouteTable {
    /*
    func updateDoneMoveLast(_ point: RNSRoutePoint?) {
        if let doneMove = point?.doneMove,
            doneMove == true {
            doneMoveLast = doneMove
        }
    }
    
    func prepareDoneMoveLast(_ item: RNSRouteTableItem?) {
        if let doneMoveLast = doneMoveLast,
            doneMoveLast == true {
            item?.doneMove = doneMoveLast
            self.doneMoveLast = nil
        }
    }
    
    func preparePreviousDoneMove(_ item: RNSRouteTableItem?) {
        guard let lastItem = lastItem else {
            return
        }
        var previousDoneMove = false
        if isLastStill {
            previousDoneMove = lastItem.lastStillDoneMove
        } else {
            previousDoneMove = lastItem.doneMove
        }
        item?.previousDoneMove = previousDoneMove
    }
 */
}
