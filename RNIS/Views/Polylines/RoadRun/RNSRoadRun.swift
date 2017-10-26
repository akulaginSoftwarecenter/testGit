//
//  RNSRoadRun.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Линия маршрута из точек
 */
class RNSRoadRun: PGPolyline {
    
    /// массив полилиний
    var polylines = [PGPolyline]()
    
    /// массив точек
    var points: [PGGeoPoint]?
    
    /// Создание полилинии
    ///
    /// - Parameter points: массив маршрутных точек
    convenience init(_ points: [RNSRoutePoint]?) {
        self.init()
        
        self.points = points?.flatMap{$0.point}
        prepareDots()
    }

    override func clear() {
        polylines.forEach{$0.clear()}
    }
    
    /// Прорисовка точек полилинии
    func prepareDots() {
        guard let points = points,
            points.count > 1 else {
            return
        }
        for index in (0..<(points.count - 1)) {
            drawDots(index, index2: index + 1)
        }
    }
    
    /// Прорисовка двух точек
    ///
    /// - Parameters:
    ///   - index1: индекс первой точки
    ///   - index2: индекс второй точки
    func drawDots(_ index1: Int?, index2: Int?) {
        let point1 = points?.valueAt(index1)
        let point2 = points?.valueAt(index2)
        let distance = point1?.distanceTo(point2) ?? 0
        let azimut =  point1?.azimuth(point2)
        let step = RNSMapManager.step
        var offset = step
        while offset < distance {
            let point = point1?.coordinate(azimut, distance: offset)
            drawDot(point)
            offset += step
        }
        drawDot(point1)
        drawDot(point2)
    }
    
    /// Прорисовка точки
    ///
    /// - Parameter point: географические координаты точки
    func drawDot(_ point: PGGeoPoint?) {
        polylines.append(RNSDotRun(point))
    }
}
