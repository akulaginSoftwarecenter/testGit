//
//  RNSBusStopDetailController+Favorite.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для избранных
 */
extension RNSBusStopDetailController {
    
    /// Добавление автобусного маршрута в избранное
    ///
    /// - Parameter item: модель автобусного маршрута
    func updateFavorite(_ busRoute: RNSBusRouteTemp?) {
        showLoader(true)
        if busRoute?.in_favorites ?? false {
            deleteFavorite(busRoute)
        } else {
            createFavorite(busRoute)
        }
    }
    
    func createFavorite(_ busRoute: RNSBusRouteTemp?) {
        RNSPostFavoriteRouteCreate(busRoute, stop_point: item) { [weak self] in
            self?.loadItems(true)
        }
    }
    
    func deleteFavorite(_ busRoute: RNSBusRouteTemp?) {
        RNSPostFavoriteRouteDelete(route_number: busRoute?.number, stop_point_uuid: item?.uuid) { [weak self] in
            self?.loadItems(true)
        }
    }

}
