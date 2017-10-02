//
//  PGGeoPoint+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension PGGeoPoint {
    var dictionary: AliasDictionary {
        return ["latitude": latitude,
                "longitude": longitude]
    }
    
    var location: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    func distanceTo(_ point: PGGeoPoint?) -> CLLocationDistance {
        guard let location = point?.location else {
            return 0
        }
        return self.location.distance(from: location)
    }
    
    var distanceToCurrent: CLLocationDistance {
        return distanceTo(RNSLocationManager.point)
    }
    
    func azimuth(_ point: PGGeoPoint?, atAzimuth: Double? = 0) -> Double? {
        return coordinate.azimuth(point?.coordinate, atAzimuth: atAzimuth)
    }
    
    func coordinate(_ azimuth: Double?, distance: Double?) -> PGGeoPoint? {
        return coordinate.coordinate(azimuth, distance: distance)?.point
    }
    
    func inverse(centerLocation: PGGeoPoint) -> PGGeoPoint {
        return coordinate.inverse(centerCoordinate: centerLocation.coordinate).point
    }
}
