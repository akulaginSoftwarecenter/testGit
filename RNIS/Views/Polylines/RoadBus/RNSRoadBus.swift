//
//  RNSRoadBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Линия маршрута автобуса
 */
class RNSRoadBus: PGPolyline {
    
    /// Массив точек
    var points: [PGGeoPoint]?
    
    /// Создание полилинии
    ///
    /// - Parameter points: массив маршрутных точек
    convenience init(_ points: [RNSRoutePoint]?) {
        self.init()
        
        self.points = points?.flatMap{$0.point}
        prepareLine()
    }
    
    convenience init(_ points: [RNSRabancItem]?) {
        self.init()
        
        self.points = points?.flatMap{$0.point}
        prepareLine()
    }
    
    /// настройка линии
    func prepareLine() {
        setBorderWidth(50)
        setLineWidth(5)
        setOutlineColor(.color13)
        setBorderWidth(1)
        preparePoints()
    }
    
    /// Прорисовка точек
    func preparePoints() {
        guard let points = points else {
            return
        }
        print("preparePoints ",points.count)
        addPoints(points, count: Int32(points.count), color: .color34)
    }
}
