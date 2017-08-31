//
//  RNSDurationItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 29.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSDurationItem: NSObject {
    var point: PGGeoPoint?
    var durationMinute: Int?
    var distance: CLLocationDistance?
    
    var handlerRemove: EmptyBlock?
    
    convenience init(_ point: PGGeoPoint?, distance: CLLocationDistance? = nil) {
        self.init()
        
        self.point = point
        self.durationMinute = Int.rand(1, limit: 10)
        self.distance = distance
    }
}
