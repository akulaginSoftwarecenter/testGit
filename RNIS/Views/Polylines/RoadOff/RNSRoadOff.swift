//
//  RNSRoadOff.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Линия закончившейся дороги
 */

class RNSRoadOff: PGPolyline {
    
    /// массив точек
    var points: [PGGeoPoint]?
    
    /// Создание линии
    ///
    /// - Parameter points: массив маршрутных точек
    convenience init(_ points: [RNSRoutePoint]?) {
        self.init()
        
        self.points = points?.flatMap{$0.point}
        prepareLine()
    }
    
    /// Настройка линии
    func prepareLine() {
        setLineWidth(5)
        preparePoints()
    }
    
    /// Прорисовка точек
    func preparePoints() {
        guard let points = points else {
            return
        }
        addPoints(points, count: Int32(points.count), color: .color163)
    }
}
