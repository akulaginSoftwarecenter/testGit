//
//  RNSBusStopDetailController+Notication.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopDetailController {
    
    func updateNotification(_ busRoute: RNSBusRouteTemp?) {
        if busRoute?.in_notifications ?? false {
            deleteNotification(busRoute)
        } else {
            createNotification(busRoute)
        }
        showLoader(true)
    }
    
    func createNotification(_ busRoute: RNSBusRouteTemp?) {
        guard let item = item, let busRoute = busRoute else {
            return
        }
        RNSNotificationCreate(bus: busRoute, stop: item, time: "20") { [weak self] in
            self?.removeLoader(true)
            self?.loadItems(true)
        }
    }
    
    func deleteNotification(_ busRoute: RNSBusRouteTemp?) {
        guard let item = item, let busRoute = busRoute else {
            return
        }
        RNSPostNotificationDelete(bus: busRoute, stop: item) { [weak self] in
            self?.removeLoader(true)
            self?.loadItems(true)
        }
    }
}

