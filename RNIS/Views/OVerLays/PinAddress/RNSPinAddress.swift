//
//  RNSPinAddress.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Пин адреса на карте
 */
class RNSPinAddress: RNSPinParent {
    
    convenience init(_ point: PGGeoPoint) {
        self.init()
        
        setBitmap(#imageLiteral(resourceName: "PinEnd"), xOffset: 0, yOffset: -1.0, isPlain: false, sizeInMeters: 50)
        preparePoint(point)
    }
}
