//
//  RNSMapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMapView: MapView {
    
    init() {
        super.init(frame: CGRect.zero)
        startApplication()
        enterForeground()
        enableMyLocation()
        setMapRegime(1)
        setMyLocationEnabled(false)
        enableCompass()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
