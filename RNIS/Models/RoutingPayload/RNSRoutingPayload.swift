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
    var route: PGPolyline?
    
    public override func mapping(map: Map) {
        distance <- map["distance"]
        parseRoute(map["points"].currentValue)
    }
    
    func parseRoute(_ currentValue: Any?) {
        guard let items = currentValue as? [[Double]] else {
            return
        }
        let points = items.flatMap({ PGGeoPoint(latitude: $0.first ?? 0, longitude: $0.last ?? 0) })
        let route = PGPolyline()
        route?.setLineWidth(5)
        route?.setOutlineColor(.color13)
        route?.setBorderWidth(1)
        route?.addPoints(points, count: Int32(points.count), color: .color34)
        self.route = route
    }
}
