//
//  STLocationManager+Delegate.swift
//  Spytricks
//
//  Created by Артем Кулагин on 17.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation
import CoreLocation
/**
 Менеджер делегата менеджара местоположения
 */
extension RNSLocationManager: CLLocationManagerDelegate {
 
    /// Метод делегата менеджера местоположения изменение статуса
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if isUse {
            manager.startUpdatingLocation()
            handlerStartLocation?()
        }
    }
    
    /// Метод делегата менеджера местоположения изменение местоположения
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        RNSLocationManager.updateLocation()
    }
    
    /// Метод обновления местоположения на карте
    static func updateLocation() {
        handlerMyLocation?()
        NotificationCenter.postLocation()
    }
}
