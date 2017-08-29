//
//  RNSRouteVariant.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRouteVariant: RNISMappableBase, Hashable {
    
    var roadActivate: [PGPolyline]?
    var roadOff: RNSRoadOff?
    
    var currentZoom: Int?
    
    var durationMinute: Int?
    var endDate: Date?
    
    var endPoint: RNSRoutePoint? {
        return points.last
    }
    var points = [RNSRoutePoint]()
    
    lazy var navels: [RNSDurationItem] = {
        var navels = [RNSDurationItem]()
        var items = [RNSRoutePoint]()
        let addNavel: ([RNSRoutePoint]) ->() = {
            if let navel = $0.navel {
                navels.append(navel)
            }
        }
        for point in self.points {
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
     
    func prepareDate() {
        let durationMinute = Int.rand(1, limit: 40)
        self.durationMinute = durationMinute
        endDate = Date().appendMinute(durationMinute)
    }
     
    func removeAllRoad() {
        removeRoadOff()
        removeRoadActivate()
    }
}
