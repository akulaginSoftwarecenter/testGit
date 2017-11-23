//
//  RNSAddressViewController+GeoCode.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressViewController {
    /// Функция получения адреса по географическим данным
    ///
    /// - Parameter point: географические координаты
    func geoCode(_ point: PGGeoPoint) {
        request?.cancel()
        endEdit()
        showLoader()
        request = RNSGetGeoCode(point) {[weak self] (address) in
            self?.removeLoader()
            self?.addPin(point)
            self?.prepareAddress(address)
        }
    }
    
    /// Функция получения текущего адреса пользователя
    func geoCodeMylocation() {
        geoCode(RNSLocationManager.point)
    }
}
