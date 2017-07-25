//
//  RNSMapViewController+OverLays.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    var overlays: NSMutableArray? {
        return mapView.overlays()
    }
    
    func addOverlay(_ obj: Any) {
        guard let overlays = overlays,
            !overlays.contains(self) else {
                return
        }
        overlays.add(obj)
    }
    
    func removeOverlay(_ obj: Any) {
        overlays?.remove(obj)
    }
}
