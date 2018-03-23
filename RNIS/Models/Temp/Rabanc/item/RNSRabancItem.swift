//
//  RNSRabancItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс таблицы остановки
 */
class RNSRabancItem: RNISMappableBase {

    /// переменная широта сущности
    var latitude: Double?
    /// переменная долгота сущности
    var longitude: Double?
    
    /// точка инициализации
    var point: PGGeoPoint?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        preparePoint()
    }
    
    /// функция парсинга и подготовки точки point
    func preparePoint() {
        guard let latitude = latitude,
            let longitude = longitude else {
                return
        }
        point = PGGeoPoint(latitude: latitude, longitude: longitude)
    }
}
