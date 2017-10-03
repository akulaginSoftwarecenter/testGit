//
//  RNSBusStopDetailCell+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStopDetailCell {
    
    @IBAction func actionAlert(_ sender: Any) {
        updateNotification?()
    }
    
    @IBAction func actionFavorite(_ sender: Any) {
        updateFavorite?()
    }
}
