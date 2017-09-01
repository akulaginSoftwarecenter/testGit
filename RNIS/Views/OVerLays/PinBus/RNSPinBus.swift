//
//  RNSPinBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinBus: RNSPinItem {
    
    override func prepareImage() {
        let image = RNSImageFactory.imageBus(item as? RNSBus)
         setBitmap(image, xOffset: 0.05, yOffset: -1.0, isPlain: false, sizeInMeters: 15)
    }
}
