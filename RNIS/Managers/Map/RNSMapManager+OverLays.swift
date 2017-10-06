//
//  RNSMapManager+OverLays.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapManager {
    
    static func showInfoIfNeed(_ item: RNSCoordinateModel?) {
        mapCenter(item?.point)
        handlerShowInfo?(item)
    }
    
    static var overlays: NSMutableArray? {
        return mapView.overlays()
    }
    
    static func addOverlay(_ obj: Any) {
        guard let overlays = overlays,
            !overlays.contains(self) else {
                return
        }
        overlays.add(obj)
    }
    
    static func removeOverlay(_ obj: Any) {
        overlays?.remove(obj)
    }
    
    static var step: Double {
        let zoom = getZoomLevel
        var step = Double(1966080)
        for _ in 1...zoom {
            step = step/2
        }
        return step
    }
    
    static func showStopPoint(_ dict: AliasDictionary?) {
        guard let dict = dict,
            let item = RNSDataManager.parseBusStopItems([dict])?.first  else {
                return
        }
        RNSMenuManager.showMap()
        RNSMapManager.mapCenter(item.point)
        RNSMapManager.setZoomLevel(16)
        RNSMapManager.showInfoIfNeed(item)
    }
}
