//
//  RNSPinBuild.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPinBuild: RNSPinParent {
    
    @discardableResult convenience init(_ point: PGGeoPoint) {
        self.init()
        
        setBitmap(#imageLiteral(resourceName: "PinBuild"), xOffset: 0, yOffset: 0, isPlain: false, sizeInMeters: 50)
        preparePoint(point)
        prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSMapManager.removeOldPinBuild()
        RNSMapManager.handlerRemovePinBuild = {[weak self] (player) in
             self?.remove()
        }
    }
}
