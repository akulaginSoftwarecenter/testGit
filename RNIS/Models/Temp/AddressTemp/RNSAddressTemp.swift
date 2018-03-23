//
//  RNSAddressTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс адреса
 */
class RNSAddressTemp: RNISMappableBase, RNSTextItem {
    
    /// переменная уникальный идентификатор сущности
    var uuid: String?
    /// переменная имени сущности
    var name: String?
    /// переменная широта сущности
    var latitude: Double?
    /// переменная долгота сущности
    var longitude: Double?
    /// массив координат в строках
    var coord: [String]?
    /// тип сущности
    var type: Int?
    /// точка инициализации
    var point: PGGeoPoint?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        uuid <- map["id"]
        name <- map["entity"]
        coord <- map["coord"]
        type <- map["type"]
        longitude = Double(coord?.first ?? "")
        latitude = Double(coord?.last ?? "")
        preparePoint()
    }
    
    /// переменная проверки что это дом
    var isHouse: Bool {
        return (type ?? -1) == 3
    }
    
    /// функция парсинга и подготовки точки point
    func preparePoint() {
        guard let latitude = latitude,
            let longitude = longitude else {
              return
        }
        point = PGGeoPoint(latitude: latitude, longitude: longitude)
    }
    
    // переменная дистанция до текущей позиции
    var distanceToCurrent: Double? {
        return point?.distanceToCurrent
    }
    
    /// функция расчет высоты в зависимости от ширины
    func heightAtWidth(_ width: CGFloat) -> CGFloat {
        let defaultHeight = kSearchViewCellDefaultHeight
        let left = kSearchViewCellDistanceRight + kSearchViewCellDistanceLeft
        guard var height = name?.height(.cffazm20, width: width - left) else {
            return defaultHeight
        }
        height += kSearchViewCellEdgeDownUp * 2
        if height < defaultHeight {
            height = defaultHeight
        }
        return height
    }
}
