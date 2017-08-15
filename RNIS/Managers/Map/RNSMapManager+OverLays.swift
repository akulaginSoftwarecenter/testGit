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
}
