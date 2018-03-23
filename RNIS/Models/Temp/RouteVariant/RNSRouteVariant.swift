//
//  RNSRouteVariant.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

/**
 Класс варианта маршрута
 */
class RNSRouteVariant: RNISMappableBase {
    
    var points: [RNSRoutePoint]?
    var pointsData: [RNSRoutePoint]?
    var dict: AliasDictionary?
    /// переменная уникальный идентификатор сущности
    var uuid: String?
    /// переменная имени сущности
    var name: String?
    
    /// Метод парсинга
    public override func mapping(map: Map) {
        points <- map["points"]
        points <- map["data.points"]
        uuid <- map[kUuid]
        name <- map[kName]
        dict = map.JSON
        prepareHashValue()
        prepareEndDate()
        setupNavels()
        prepareDisplayData()
    }
    
    var hashValue: Int = 0
    var time: Int?
    var roadActivate: [PGPolyline]?
    var roadOff: RNSRoadOff?
    var currentZoom: Int?
    var endDate: Date?
    var navels: [RNSDurationItem]?
    var maxSize: Double?
    var centerPoint: PGGeoPoint?
    var showDistanceNavels = false {
        didSet {
            updateDistanceNavels()
        }
    }
    
    func removeAllRoad() {
        removeRoadOff()
        removeRoadActivate()
    }
    
    lazy var dotsVerticalModel: RNSDotsVerticalModel = {
        return RNSDotsVerticalModel(self)
    }()
}
