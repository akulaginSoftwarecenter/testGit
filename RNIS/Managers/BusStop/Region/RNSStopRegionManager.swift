//
//  RNSStopRegionManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import MapKit

class RNSStopRegionManager: NSObject {
    var regions = [MKMapRect]()
    
    func сontinueIfNotContain(_ rect: MKMapRect?, сontinue: EmptyBlock?) {
        guard let rect = rect else {
            return
        }
        //Utils.queueUserInitiated {
            for item in self.regions {
                if item.contains(rect) {
          //          Utils.mainQueue {
                        сontinue?()
            //        }
                }
            }
       // }
    }
    
    func add(_ rect: MKMapRect?, complete: EmptyBlock?) {
        guard let rect = rect else {
            return
        }
        regions = regions.filter({
            return !$0.contains(rect)
        })
        regions.append(rect)
    }
    /*
    func mapRect(_ min: PGGeoPoint, center: PGGeoPoint) -> MKMapRect {
        
    }
    */
}
