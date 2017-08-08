//
//  RNSMapManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMapManager: NSObject {
    
    static var pointFrom: PGGeoPoint?
    static var pointHere: PGGeoPoint?

    static var handlerAddOverlay: AnyBlock?
    static var handlerRemoveOverlay: AnyBlock?
    static var handlerRemovePinBuild: EmptyBlock?
    static var handlerAddRoute: ((PGPolyline?) -> ())?
    static var handlerDismissOldPresentVC: EmptyBlock?
    
    static func prepareRoutePoints() {
        let point = RNSLocationManager.point
        pointFrom = point
        pointHere = point
    }
    
    static func removeOldPinBuild() {
        handlerRemovePinBuild?()
    }
    
    static func prepareStubBusStop() {
        RNSDataManager.createStubStubBusIfNeed()
        
        guard let items = RNSDataManager.busStops else {
            return
        }
        for item in items {
            RNSPinBusStop(item)
        }
        
    }
}
