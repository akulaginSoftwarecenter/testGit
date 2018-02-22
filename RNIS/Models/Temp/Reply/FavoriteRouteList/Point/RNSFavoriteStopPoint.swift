//
//  RNSFavoriteStopPoint.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс остановки автобуса
 */
class RNSFavoriteStopPoint: RNISMappableBase, Hashable {
    
    var hashValue: Int {
        guard let uuid = stop_point_uuid else {
            return 0
        }
        return uuid.hashValue
    }
    
    static func ==(lhs: RNSFavoriteStopPoint, rhs: RNSFavoriteStopPoint) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var forecast: [RNSForecastBus]?
    var stop_point_title: String?
    var stop_point_uuid: String?
    var stop_point_latitude: Double?
    var stop_point_longitude: Double?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        forecast <- map["forecast"]
        stop_point_title <- map["stop_point_title"]
        stop_point_uuid <- map[kStop_point_uuid]
        stop_point_latitude <- map["stop_point_latitude"]
        stop_point_longitude <- map["stop_point_longitude"]
    }
    
    var height: CGFloat {
        var count: CGFloat = 0
        if let forcount = forecast?.count {
            count = CGFloat(forcount)
        }
        return 45 + count * 49
    }
    
    var point: PGGeoPoint? {
        guard let latitude = stop_point_latitude,
            let longitude = stop_point_longitude else {
            return nil
        }
        return PGGeoPoint(latitude: latitude, longitude: longitude)
    }
    
    var isBeside: Bool {
        guard let distance = point?.distanceToCurrent else {
            return false
        }
        return distance < 1000
    }
    
    var dict: AliasDictionary {
        guard var dict = point?.dictionary,
            let uuid = stop_point_uuid,
            let title = stop_point_title else {
            return [:]
        }
        dict[kUuid] = uuid
        dict[kName] = title
        return dict
    }
}
