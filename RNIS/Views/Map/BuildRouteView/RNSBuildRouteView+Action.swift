//
//  RNSBuildRouteView+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBuildRouteView {
    
    @IBAction func removeAction(_ sender: Any) {
        removeAnimate()
    }
    
    @IBAction func actionFrom(_ sender: Any) {
        RNSMapManager.pointFrom = point
        requestRoute()
     }
    
    @IBAction func actionHere(_ sender: Any) {
        RNSMapManager.pointHere = point
        requestRoute()
    }
}
