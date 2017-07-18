//
//  STLocationManager+Delegate.swift
//  Spytricks
//
//  Created by Артем Кулагин on 17.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation
import CoreLocation

extension STLocationManager: CLLocationManagerDelegate {
 
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if isUse {
            manager.startUpdatingLocation()
            handlerStartLocation?()
        }
    }
}
