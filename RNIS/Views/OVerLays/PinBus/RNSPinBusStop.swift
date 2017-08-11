//
//  RNSPinBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinBusStop: RNSPinItem {
    
    override func prepareImage() {
        setBitmap(#imageLiteral(resourceName: "Bus_stop"), xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 15)
    }
}
