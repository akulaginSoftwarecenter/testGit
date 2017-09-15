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
    }
    
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    
    func prepareMapView() {
        mapView.setMapCenter(PGGeoPoint(latitude: 59.935051, longitude: 30.306572))
        mapView.setZoomLevel(17)
    }
}
