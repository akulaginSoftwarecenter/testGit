//
//  STLocationManager.swift
//  Spytricks
//
//  Created by Артем Кулагин on 14.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit
import CoreLocation

class STLocationManager: NSObject {
    
    static let shared = STLocationManager()
    
    var handlerStartLocation: EmptyBlock?
    
    lazy var locationManager:CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.activityType = .fitness
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 2
        locationManager.headingFilter = 1
        return locationManager
    }()
    
    static var location:CLLocation {
        if let stubloc = stubLocation {
            return stubloc
        }

        var location = CLLocation()
        if let value = shared.locationManager.location {
            location = value
        }
        return location
    }
    
    static var point: PGGeoPoint {
        return PGGeoPoint(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    static var coordinate:CLLocationCoordinate2D {
        return location.coordinate
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    static func startLocation(_ handler: EmptyBlock?) {
        shared.startLocation(handler)
    }
    
    func startLocation(_ handler: EmptyBlock?) {
        print("isUse",isUse)
        if isUse {
            handler?()
        } else {
            handlerStartLocation = handler
        }
    }
    
    var isUse: Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    }
}
