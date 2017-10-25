//
//  STLocationManager.swift
//  Spytricks
//
//  Created by Артем Кулагин on 14.02.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit
import CoreLocation
/**
 Контроллер определения геолокации пользователя
 */
class RNSLocationManager: NSObject {
    
    static let shared = RNSLocationManager()
    
    /// Создание блока определения геолокации
    var handlerStartLocation: EmptyBlock?
    static var handlerMyLocation: EmptyBlock?
    
    /// Создание экземпляра менеджера местоположения
    lazy var locationManager:CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.activityType = .automotiveNavigation
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 5
        locationManager.headingFilter = 1
        return locationManager
    }()
    
    /// Создание экземпляра местоположения
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
    
    /// Создание экземпляра точки местополоежния
    static var point: PGGeoPoint {
        return PGGeoPoint(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    /// Сооздание экземпляра двумерного местоположения
    static var coordinate:CLLocationCoordinate2D {
        return location.coordinate
    }
    
    /// Функция переинициализации родительским классом
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    /// Запуск определения местоположения
    static func startLocation(_ handler: EmptyBlock?) {
        shared.startLocation(handler)
    }
    
    /// Запуск блока определения местоположения
    func startLocation(_ handler: EmptyBlock?) {
        if isUse {
            handler?()
        } else {
            handlerStartLocation = handler
        }
    }
    
    /// Возвращаения статуса использования менеджера местоположения
    var isUse: Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    }
}
