//
//  RNSRectPoint+Set.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с устновкой
 */
extension RNSRectPoint {
    
    func preparePoints() {
        leftUp = pointStart?.coordinate(azimutMinus, distance: step)
        leftDown = pointStart?.coordinate(azimutPlus, distance: step)
        
        rightUp = pointEnd?.coordinate(azimutMinus, distance: step)
        rightDown = pointEnd?.coordinate(azimutPlus, distance: step)
    }
    
    func prepareSpace() {
        guard let verticalSide = verticalSide,
            let up = horizontalSide else {
                return
        }
        self.originalSpace = verticalSide * up
    }
}
