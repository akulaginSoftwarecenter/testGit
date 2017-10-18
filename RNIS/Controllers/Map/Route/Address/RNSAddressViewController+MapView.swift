//
//  RNSAddressViewController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSAddressViewController MapView extention
 */

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
        endEdit()
        STRouter.showLoader()
        RNSGetGeoCode(point) {[weak self] (address) in
            STRouter.removeLoader()
            self?.addPin(point)
            self?.prepareAddress(address)
        }
    }
    
    func geoCodeMylocation() {
        geoCode(RNSLocationManager.point)
    }
    
    func removePin() {
        pin?.remove()
    }
    
    func addPin(_ point: PGGeoPoint) {
        removePin()
        pin = RNSPinAddress(point)
    }
}
