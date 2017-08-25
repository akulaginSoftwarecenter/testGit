//
//  RNSRectPoint+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRectPoint {
    
    var azimutMinus: Double {
        guard var azimut = azimut else {
            return 0
        }
        azimut -= 90
        if azimut < 0 {
            azimut = 360 + azimut
        }
        return azimut
    }
    
    var azimutPlus: Double {
        guard var azimut = azimut else {
            return 0
        }
        azimut += 90
        if azimut > 360 {
            azimut = azimut - 360
        }
        return azimut
    }
     
    var verticalSide: Double? {
        return leftUp?.distanceTo(leftDown)
    }
     
    var horizontalSide: Double? {
        return leftUp?.distanceTo(rightUp)
    }
    
    var leftUpDistance: Double? {
        return leftUp?.distanceTo(searchPoint)
    }
    
    var leftDownDistance: Double? {
        return leftDown?.distanceTo(searchPoint)
    }
    
    var rightUpDistance: Double? {
        return rightUp?.distanceTo(searchPoint)
    }
    
    var rightDownDistance: Double? {
        return rightDown?.distanceTo(searchPoint)
    }
}
