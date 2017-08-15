//
//  RNSMapViewController+Traffic.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    var getTraffic: Bool {
        return mapView.getTraffic() 
    }
    
    func changeTraffic() {
        mapView.setTraffic(!getTraffic)
        updateStateLightButton()
        
    }
    
    func prepareLightButton() {
        lightButton.handlerAction = { [weak self] in
            self?.changeTraffic()
        }
        updateStateLightButton()
    }
    
    func updateStateLightButton() {
        if getTraffic {
            lightButton.loadTraffic(minCoord: mapView.lastMinCoord, maxCoord: mapView.lastMaxCoord, zoom: mapView.getZoomLevel())
        } else {
            lightButton.hiddenTraffic()
        }
    }
}
