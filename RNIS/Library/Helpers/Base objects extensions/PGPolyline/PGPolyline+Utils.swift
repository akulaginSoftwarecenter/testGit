//
//  PGPolyline+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension PGPolyline {
    func addOnMap() {
        RNSMapManager.addOverlay(self)
    }
    
    func remove() {
        RNSMapManager.removeOverlay(self)
    }
}
