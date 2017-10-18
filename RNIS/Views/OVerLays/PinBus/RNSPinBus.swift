//
//  RNSPinBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Pin Bus
 */

class RNSPinBus: RNSPinItem {
    
    override func prepareImage() {
        prepareIcon(#imageLiteral(resourceName: "BusIcon"))
        
        guard  let text = (self.item as? RNSBus)?.route_number else {
            return
        }
        DispatchQueue.global(qos: .background).async {
            let image = RNSImageFactory.imageBusAt(text)
            Utils.mainQueue {
                 self.prepareIcon(image)
            }
        }
    }
    
    func prepareIcon(_ image: UIImage) {
        setBitmap(image, xOffset: 0.05, yOffset: -1.0, isPlain: false, sizeInMeters: 15)
    }
    
    override func prepareHandlers() {
        super.prepareHandlers()
        item?.handlerUpdateLocaton = { [weak self] in
            self?.updateLocation()
        }
    }
    
    func updateLocation() {
        guard let point = item?.point else {
            return
        }
      //  print("uuid",item?.uuid as Any)
       // print("point",point as Any)
        overlayItem.geoPoint = point
        populate()
    }
}
