//
//  RNSRoutePoint+Parse.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с парсером
 */
extension RNSRoutePoint {
    /// функция парсинга и подготовки точки point
    func preparePoint() {
        guard let latitude = latitude,
            let longitude = longitude else {
                return
        }
        point = PGGeoPoint(latitude: latitude, longitude: longitude)
    }
    
    func prepareType() {
        guard let typePoint = typePoint else {
            return
        }
        
        type = TypePoint(rawValue: typePoint)
    }
    
    func prepareRoute() {
        route?.point = point
    }
}
