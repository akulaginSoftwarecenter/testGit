//
//  RNSMoveMapViewController+Item.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMoveMapViewController {
    func prepareItem() {
        item?.prepareRoadActivate()
        item?.prepareDisplayMap()
        item?.showDistanceNavels = true
    }
    
    func closeItem() {
        item?.removeAllRoad()
        item?.showDistanceNavels = false
    }
}
