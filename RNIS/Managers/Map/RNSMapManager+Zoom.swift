//
//  RNSMapManager+Zoom.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
/**
 Контоллер управления уровнем приближения карты
 */
extension RNSMapManager {
    /// Получение уровня приближения карты
    static var getZoomLevel: Int {
        return Int(mapView.getZoomLevel())
    }
    
    /// Функция задание уровня приближения карты
    static func zoomAtDistance(_ distance: CGFloat?) -> Int32? {
        guard let distance = distance else {
            return nil
        }
        var metersInPixel = CGFloat(0.7)
        let sizeWidth = UIScreen.main.nativeBounds.width
        
        for zoom in (1...17).reversed() {
            let distanceWidth = metersInPixel * sizeWidth
            if distanceWidth > distance {
                return Int32(zoom)
            }
            metersInPixel = metersInPixel * 2
        }
        return nil
    }
}
