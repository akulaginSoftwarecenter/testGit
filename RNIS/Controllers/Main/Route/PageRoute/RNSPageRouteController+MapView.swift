//
//  RNSPageRouteController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 RNSPageRouteController MapView extention
 */

extension RNSPageRouteController {
    
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    func prepareMapView() {
        RNSPageRouteManager.currentPrepareDisplay()
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
