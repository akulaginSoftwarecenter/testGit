//
//  RNSMapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Карта
 */
class RNSMapView: MapView {
    
    /// Инициализация карты
    init() {
        super.init(frame: CGRect.zero)
        startApplication()
        enterForeground()
        enableMyLocation()
        setMapRegime(1)
        setMapHost("http://95.181.199.194/")
        setMyLocationEnabled(false)
        enableCompass()
      //  myLocationOverlay().setBitmap(#imageLiteral(resourceName: "ic_userDirection"), xOffset: 0, yOffset: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
