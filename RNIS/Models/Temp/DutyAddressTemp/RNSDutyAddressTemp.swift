//
//  RNSDutyAddressTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс адреса
 */
class RNSDutyAddressTemp: RNISMappableBase {
    var address: String?
    /// переменная широта сущности
    var latitude: Double?
    /// переменная долгота сущности
    var longitude: Double?
    
    /// Метод парсинга
    override func mapping(map: Map) {
        address <- map["address"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
    
    /// Метод инициализации 
    convenience init(_ point: PGGeoPoint?) {
        self.init()
        self.latitude = point?.latitude
        self.longitude = point?.longitude
    }
    
    /// точка инициализации
    var point: PGGeoPoint? {
        guard let latitude = latitude,
            let longitude = longitude else {
                return nil
        }
        return PGGeoPoint(latitude: latitude, longitude: longitude)
    }
    
    func loadAddress(_ complete: EmptyBlock?) {
        RNSGetGeoCode(point) {[weak self] (address) in
            self?.address = address
            complete?()
        }
    }
}
