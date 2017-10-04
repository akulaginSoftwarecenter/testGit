//
//  RNSBusStopDetailController+UpdateData.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopDetailController {
    
    func loadItems() {
        showLoader()
        RNSStopPointRoutes(item, complete: { [weak self] items in
            self?.prepareItems(items)
            self?.removeLoader()
            }, failure: { error in
                // self?.prepareError(error)
        })
    }
    
    func prepareItems(_ items: [RNSBusRouteTemp]?) {
        self.items = items
        prepareTableView()
    }
    
    func showLoader() {
        loaderView.showInView(self.view)
    }
    
    func removeLoader() {
        loaderView.remove()
    }
    
    func prepareTitle() {
        titleLabel.text = item?.name
    }
    
    func updateFavorite(_ item: RNSBusRouteTemp?) {
        guard let item = item else {
            return
        }
        RNSPostFavoriteRouteCreate(item) { [weak self] in
            self?.removeLoader()
            self?.loadItems()
        }
        showLoader()
    }

    func updateNotification(_ busRoute: RNSBusRouteTemp?) {
        guard let item = item, let busRoute = busRoute else {
            return
        }
        RNSNotificationCreate(bus: busRoute, stop: item, time: "20") { [weak self] in
            self?.removeLoader()
            self?.loadItems()
        }
        showLoader()
    }
}
