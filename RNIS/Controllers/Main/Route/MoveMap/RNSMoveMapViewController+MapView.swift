//
//  RNSMoveMapViewController+MapView.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMoveMapViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let containerController = segue.destination as? RNSMapParentController
        containerController?.bottomTargetConstant = 91
        containerController?.handlerOnMapLongTouchEvent = {[weak self] point in
            self?.onMapLongTouchEvent(point)
        }
        containerController?.handlerOnMapEvent = {[weak self] in
            self?.onMapEvent()
        }
    }
    
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    func onMapLongTouchEvent(_ point: PGGeoPoint) {
        prepareStubLocation(point.location)
    }

    func prepareMapView() {
        RNSPageRouteManager.removeAllRoute()
        prepareItem()
    }
    
    func onMapEvent() {
        item?.prepareRoadActivateAtZoom()
    }
}
