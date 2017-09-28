//
//  RNSMapViewController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMapParentController
        prepareHandlerMapView()
    }
    
    func onMapEvent() {
        busUpdate()
        busStopUpdate()
    }
    
    func busUpdate() {
        showLoader()
        RNSBusManager.updateServer { [weak self] in
            self?.removeLoader()
        }
    }
    
    func busStopUpdate() {
        showLoader()
        RNSBusStopManager.updateServer { [weak self] in
            self?.removeLoader()
        }
    }
    
    func onMapTouchEvent(_ point: PGGeoPoint) {
        dismissOldPresentVC()
    }
    
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        RNSBuildRouteView(point)
        mapCenter(point)
        RNSPinBuild(point)
    }
    
    func onOverlay(_ overlay: PGOverlay!, item: PGOverlayItem!) {
        RNSMapManager.showInfoIfNeed((overlay as? RNSPinItem)?.item)
    }
    
    func mapCenter(_ point: PGGeoPoint?) {
        RNSMapManager.mapCenter(point)
    }
 }
