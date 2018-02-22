//
//  Double+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для Double
 */
extension Double {
    
    var radian: Double {
        return self * Double.pi/180
    }
    
    var angle: Double {
        return self * 180/Double.pi
    }
    
    var square: Double {
        return pow(self, 2)
    }
}
