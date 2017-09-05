//
//  RNSBusStopTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusStopTemp: RNISMappableBase, RNSTextItem, Hashable  {
    
    var hashValue: Int {
        guard let uuid = uuid, let name = name else {
            return 0
        }
        return uuid.hashValue ^ name.hashValue
    }
    
    var uuid: String?
    var name: String?
    
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
}
