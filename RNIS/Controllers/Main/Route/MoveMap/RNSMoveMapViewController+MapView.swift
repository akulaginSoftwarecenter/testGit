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
        containerController?.handlerOnMapTouchEvent = {[weak self] point in
            self?.onMapTouchEvent(point)
        }
    }
    
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    func onMapTouchEvent(_ point: PGGeoPoint) {
        stubLocation = point.location
        RNSLocationManager.updateLocation()
    }

    func prepareMapView() {
        item?.zoomToRoute()
    }
}
