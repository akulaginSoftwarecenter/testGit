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
    
    static func generate(_ point: PGGeoPoint) -> RNSBusTemp {
        let item = RNSBusTemp()
        item.point = point
        item.num = Int.rand(1, limit: 200)
        return item
    }
    
    var titleWidth: CGFloat {
        return title.width(.cffazm20) + 22
    }
    
    static func ==(lhs: RNSBusTemp, rhs: RNSBusTemp) -> Bool {
        return lhs.title == rhs.title
    }
}
