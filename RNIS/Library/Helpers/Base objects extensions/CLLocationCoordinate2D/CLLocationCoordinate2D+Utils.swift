//
//  CLLocationCoordinate2D+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для CLLocationCoordinate2D
 */
extension CLLocationCoordinate2D {
    
    var point: PGGeoPoint {
        return PGGeoPoint(latitude: self.latitude, longitude: self.longitude)
    }
    
    var location:CLLocation {
        return CLLocation(latitude: self.latitude, longitude: self.longitude)
    }
    
    func inverse(centerCoordinate:CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let latitude = 2 * centerCoordinate.latitude - self.latitude
        let longitude = 2 * centerCoordinate.longitude - self.longitude
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func distance(_ coordinate: CLLocationCoordinate2D) -> CLLocationDistance {
        return self.location.distance(from: coordinate.location)
    }
    
    func coordinate(_ azimuth: Double?, distance: Double?) -> CLLocationCoordinate2D? {
        guard let azimuth = azimuth,
            let distance = distance else {
            return nil
        }
        let radian = azimuth.radian
        let x = latitude + latitudeDelta(distance: distance) * cos(radian)
        let y = longitude + longitudeDelta(distance: distance) * sin(radian)
        return CLLocationCoordinate2DMake(x, y)
    }
    
    var radianLatitude: Double {
        return latitude.radian
    }
    
    var latitudeKM: Double {
        return 111.143 - 0.562 * cos(2 * radianLatitude)
    }
    
    var longitudeKM: Double {
        return 111.321 * cos(radianLatitude) - 0.094 * cos(3 * radianLatitude)
    }
    
    func latitudeDelta(distance: Double) -> Double {
        return distance/(latitudeKM * 1000)
    }
    
    func longitudeDelta(distance: Double) -> Double {
        return distance/(longitudeKM * 1000)
    }
    
    func longitude(append distance: Double) -> Double {
        return longitude + longitudeDelta(distance: distance)
    }
    
    func latitude(append distance: Double) -> Double {
        return latitude + latitudeDelta(distance: distance)
    }
    
    func azimuth(_ coordinate: CLLocationCoordinate2D?, atAzimuth: Double? = 0) -> Double? {
        guard let coordinate = coordinate,
            let atAzimuth = atAzimuth,
            let c = self.coordinate(0, distance: 1000000) else {
            return nil
        }
        
        let a = self
        let b = coordinate
        let ab = a.distance(b)
        let bc = b.distance(c)
        let ac = a.distance(c)
        let sqrtValue = pow(ab,2) + pow(ac,2) - pow(bc,2)
        let drob = 2 * ab * ac
        var radian = sqrtValue/drob
        if radian > 1 {
            radian = 1
        }
        let alpha = acos(radian)
        var angle = alpha.angle
        let dX = b.longitude - a.longitude
        if dX < 0 {
            angle = 360 - angle
        }
        angle = angle - atAzimuth
        if angle < 0 {
            angle = 360 + angle
        }
        return angle
    }
}
