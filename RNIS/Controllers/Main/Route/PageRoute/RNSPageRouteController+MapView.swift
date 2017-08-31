//
//  RNSPageRouteController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPageRouteController {
    
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    func prepareMapView() {
        mapView.setMapCenter(PGGeoPoint(latitude: 59.935051, longitude: 30.306572))
        mapView.setZoomLevel(17)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerController = segue.destination as? RNSMapParentController
        containerController?.bottomTargetConstant = 180
        prepareEnterViewController()
    }
    
    func prepareEnterViewController(){
        containerController?.handlerOnMapEvent = {[weak self] in
            self?.onMapEvent()
        }
        
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
    }
    
    func onMapTouchEvent(_ point: PGGeoPoint) {
        RNSPageRouteManager.checkContaints(point)
    }
    
    func onMapEvent() {
        RNSPageRouteManager.activeRoadReload()
    }
}
