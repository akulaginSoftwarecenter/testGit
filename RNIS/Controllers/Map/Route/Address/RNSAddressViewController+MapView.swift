//
//  RNSAddressViewController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для обработки событий карты
 */
extension RNSAddressViewController {
    
    /// Событие нажатия на карту
    ///
    /// - Parameter point: географические положение места касания на карте
    func onMapTouchEvent(_ point: PGGeoPoint) {
        geoCode(point)
    }
    
    /// Событие длительного нажатия на карту
    ///
    /// - Parameter point: географические положение места касания на карте
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        geoCode(point)
    }
    
    /// Событие добавления оверлея на карту
    ///
    /// - Parameters:
    ///   - overlay: оверлей
    ///   - item: объект, описывающий географическое положение оверлея на карте
    func onOverlay(_ overlay: PGOverlay!, item: PGOverlayItem!) {
        geoCode(item.geoPoint)
    }
    
    /// Функция получения адреса по географическим данным
    ///
    /// - Parameter point: географические координаты
    func geoCode(_ point: PGGeoPoint) {
        endEdit()
        STRouter.showLoader()
        RNSGetGeoCode(point) {[weak self] (address) in
            STRouter.removeLoader()
            self?.addPin(point)
            self?.prepareAddress(address)
        }
    }
    
    /// Функция получения текущего адреса пользователя
    func geoCodeMylocation() {
        geoCode(RNSLocationManager.point)
    }
    
    /// Удаление пина с карты
    func removePin() {
        pin?.remove()
    }
    
    /// Добавление пина на карту в указанные координаты
    ///
    /// - Parameter point: координаты
    func addPin(_ point: PGGeoPoint) {
        removePin()
        pin = RNSPinAddress(point)
    }
}
