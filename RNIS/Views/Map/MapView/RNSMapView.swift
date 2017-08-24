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
        //setMapHost(mapHost)
        //setTrafficMarksHost(mapHost)
        enterForeground()
        enableMyLocation()
        setMapRegime(1)
        let overlay = myLocationOverlay()
        overlay?.setBitmap(#imageLiteral(resourceName: "ic_userLocation"), xOffset: 0, yOffset: 0)
        overlay?.setRotationEnabled(false)
        enableCompass()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
