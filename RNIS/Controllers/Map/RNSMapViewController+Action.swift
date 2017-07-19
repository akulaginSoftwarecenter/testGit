//
//  RNSMapViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    var trafficEnabled: Bool {
        return lightButton.isSelected
    }
    
    @IBAction func lightAction(_ sender: Any) {
        changeTraffic()
        print("changeTraffic")
    }
    
    @IBAction func compasAction(_ sender: Any) {
        setMapRegime(0)
        Utils.delay(0.2) {
            self.setMapRegime(1)
        }
    }
    
    func setMapRegime(_ value: Int32) {
        mapView.setMapRegime(value)
    }
    
    @IBAction func plusAction(_ sender: Any) {
        mapView.zoomIn()
    }
    
    @IBAction func minusAction(_ sender: Any) {
        mapView.zoomOut()
    }
    
    @IBAction func userLocationAction(_ sender: Any) {
        startLocation()
    }
}
