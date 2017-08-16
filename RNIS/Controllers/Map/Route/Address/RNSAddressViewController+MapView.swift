//
//  RNSAddressViewController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressViewController {
    
    func onMapTouchEvent(_ point: PGGeoPoint) {
        geoCode(point)
    }
    
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        geoCode(point)
    }
    
    func onOverlay(_ overlay: PGOverlay!, item: PGOverlayItem!) {
        geoCode(item.geoPoint)
    }
    
    func geoCode(_ point: PGGeoPoint) {
        STRouter.showLoader()
        RNSLocationManager.geoCode(point) {[weak self] text in
            STRouter.removeLoader()
            self?.textField.text = text
        }
    }
}
