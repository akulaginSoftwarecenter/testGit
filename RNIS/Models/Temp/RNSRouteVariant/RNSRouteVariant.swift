//
//  RNSRouteVariant.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRouteVariant: RNISMappableBase {
    
    var points: [RNSRoutePoint]?
    var time: Int?
    
    public override func mapping(map: Map) {
        points <- map["points"]
        time <- map["time"]
        prepareHashValue()
        prepareCenterPoint()
        prepareEndDate()
    }
    
    var hashValue: Int = 0
    
    var isFavorite: Bool = false
    var roadActivate: [PGPolyline]?
    var roadOff: RNSRoadOff?
    var currentZoom: Int?
    var endDate: Date?
    var title: String?
    var centerPoint: PGGeoPoint? 
    
    var endPoint: RNSRoutePoint? {
        return points?.last
    }
    
    lazy var navels: [RNSDurationItem] = {
        var navels = [RNSDurationItem]()
        var items = [RNSRoutePoint]()
        let addNavel: ([RNSRoutePoint]) ->() = {
            if let navel = $0.navel {
                navels.append(navel)
            }
        }
        for point in self.points ?? [] {
            if items.last?.different(point) ?? false {
                items.append(point)
                addNavel(items)
                items = [RNSRoutePoint]()
            }
            items.append(point)
        }
        addNavel(items)
        return navels
    }()
     
    func removeAllRoad() {
        removeRoadOff()
        removeRoadActivate()
    }
    
    var tableItem: RNSRouteTable {
        return RNSRouteTable(self)
    }
    
    lazy var dotsVerticalModel: RNSDotsVerticalModel = {
        return RNSDotsVerticalModel(self)
    }()
    
    var heightDotsVerticalModel: CGFloat {
        return dotsVerticalModel.height
    }
    
    func changeFavorite(complete: EmptyBlock?) {
        isFavorite = !isFavorite
        Utils.delay(1, closure: complete)
    }
}
