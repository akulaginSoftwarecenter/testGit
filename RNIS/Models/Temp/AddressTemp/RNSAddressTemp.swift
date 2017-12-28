//
//  RNSAddressTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSAddressTemp: RNISMappableBase, RNSTextItem {
    
    var uuid: String?
    var name: String?
    var latitude: Double?
    var longitude: Double?
    var coord: [String]?
    var type: Int?
    var point: PGGeoPoint?
    
    public override func mapping(map: Map) {
        uuid <- map["id"]
        name <- map["entity"]
        coord <- map["coord"]
        type <- map["type"]
        longitude = Double(coord?.first ?? "")
        latitude = Double(coord?.last ?? "")
        preparePoint()
    }
    
    var isHouse: Bool {
        return (type ?? -1) == 3
    }
    
    func preparePoint() {
        guard let latitude = latitude,
            let longitude = longitude else {
              return
        }
        point = PGGeoPoint(latitude: latitude, longitude: longitude)
    }
    
    var distanceToCurrent: Double? {
        return point?.distanceToCurrent
    }
    
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
