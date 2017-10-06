//
//  RNSMapParentController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapParentController {
    
    @IBAction func compasAction(_ sender: Any) {
        setMapRegime(0)
        Utils.delay(0.2) {
            self.setMapRegime(1)
        }
    }

    @IBAction func menuAction(_ sender: Any) {
        RNSMenuManager.showLeftMenu()
    }

    @IBAction func searchAction(_ sender: Any) {
        RNSSearchViewController.initialPushAnimatedRed()
    }
    
    @IBAction func plusAction(_ sender: Any) {
        mapView.zoomIn()
    }
    
    @IBAction func minusAction(_ sender: Any) {
        mapView.zoomOut()
    }
    
    @IBAction func userLocationAction(_ sender: Any) {
        RNSMapManager.startLocation()
    }
}
