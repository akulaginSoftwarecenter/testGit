//
//  RNSRoutingPayload.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSRoutingPayload: RNISMappableBase {
    
    var distance: CGFloat?
    var route: PGLiteRoute?
    
    public override func mapping(map: Map) {
        distance <- map["distance"]
        parseRoute(map["points"].currentValue)
    }
    
    func parseRoute(_ currentValue: Any?) {
        guard let items = currentValue as? [[Double]] else {
            return
        }
        let points = items.flatMap({ (array) -> PGRoutePoint! in
            let point = PGGeoPoint(latitude: array.first ?? 0, longitude: array.last ?? 0)
            return PGRoutePoint(pos: point, title: "") })
        print("points",points)
        let route = PGLiteRoute()
        route.setStartPos(points.first)
        route.setFinishPos(points.last)
        route.setViaPos(points)
        self.route = route
    }
}
