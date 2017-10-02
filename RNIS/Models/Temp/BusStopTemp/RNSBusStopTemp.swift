//
//  RNSBusStopTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import ObjectMapper

class RNSBusStopTemp: RNISMappableBase, RNSTextItem, Hashable  {
    
    var hashValue: Int {
        guard let uuid = uuid, let name = name else {
            return 0
        }
        return uuid.hashValue ^ name.hashValue
    }
    
    var uuid: String?
    var name: String?
    var latitude: Double?
    var longitude: Double?
    
    var forecast: [RNSRouteBusTemp]?
    
    var text: String? {
        get {
            return name
        }
        set {
            name = newValue
        }
    }
    
    convenience init(_ name: String?) {
        self.init()
        
        self.name = name
    }
    
    static func ==(lhs: RNSBusStopTemp, rhs: RNSBusStopTemp) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    var height: CGFloat {
        return CGFloat(45 + (forecast?.count ?? 0) * 49)
    }
    
    public override func mapping(map: Map) {
        uuid <- map["uuid"]
        name <- map["name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
