//
//  RNSDotRun.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Горизонтальная линия из точек двух точек
 */
class RNSDotRun: PGPolyline {
    var point: PGGeoPoint?
    
    /// Создание представления
    ///
    /// - Parameter point: точка начала линии
    convenience init(_ point: PGGeoPoint?) {
        self.init()
        
        self.point = point
        prepareLine()
    }
    
    /// Настройка параметров отображения линии
    func prepareLine() {
        setLineWidth(4)
        setOutlineColor(.color13)
        setBorderWidth(1)
        preparePoint()
    }
    
    /// Нанесение точек на карту
    func preparePoint() {
        guard let point = point else {
            return
        }
        let tempPoint = PGGeoPoint(latitude: point.latitude, longitude: point.longitude + 0.00001)
        let points = [point, tempPoint]
        addPoints(points, count: Int32(points.count), color: .color34)
    }
}
