//
//  RNSLocationManager+GeoCode.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import CoreLocation

extension RNSLocationManager {
    
    static func geoCode(_ point: PGGeoPoint, complete: AliasStringBlock?) {
        CLGeocoder().reverseGeocodeLocation(point.location) {(placemarks, error) in
            if (error != nil) {
                //print("reverse geodcode fail: \(error!.localizedDescription)")
                complete?(nil)
            }
            let pm = placemarks! as [CLPlacemark]
            if pm.count > 0 {
                let pm = placemarks![0]
                /*
                print(pm.country as Any)
                print(pm.locality as Any)
                print(pm.subLocality as Any)
                print(pm.thoroughfare as Any)
                print(pm.postalCode as Any)
                print(pm.subThoroughfare as Any)
                 */
                var address = String()
                
                if let thoroughfare = pm.thoroughfare {
                    address = address + thoroughfare
                }
                
                if let subThoroughfare = pm.subThoroughfare {
                    address = address + ", " + subThoroughfare
                }
                //print(address)
                complete?(address)
            }
        }
    }
    
    static func geoCodeMylocation(complete: AliasStringBlock?) {
        geoCode(point, complete: complete)
    }
}
