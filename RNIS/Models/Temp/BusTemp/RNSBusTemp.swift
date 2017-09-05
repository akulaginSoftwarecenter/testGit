//
//  RNSBusTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusTemp: RNISMappableBase, RNSTextItem, Hashable   {
    var hashValue: Int {
        return num ?? 0
    }

    var text: String?
    var title: String {
        return "A" + "\(num ?? 0)"
    }
   
    var point: PGGeoPoint?
    var num: Int?
    var handlerRemove: EmptyBlock?
    var doneMove = false
    
    var titleWidth: CGFloat {
        return title.width(.cffazm20) + 22
    }
    
    static func ==(lhs: RNSBusTemp, rhs: RNSBusTemp) -> Bool {
        return lhs.title == rhs.title
    }
    
    var stop_points: [RNSBusStopTemp]?
    var next_stop_point: RNSBusStopTemp?
    
    var driver: String?
    var check_taker: String?
    var carrier_name: String?
    var unit_name: String?
    var unit_phone: String?
    
    var tableModel: RNSBusTableModel {
        return RNSBusTableModel(self)
    }
}
