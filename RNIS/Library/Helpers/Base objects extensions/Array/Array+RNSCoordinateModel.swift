//
//  Array+BusStop.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension Array where Element: RNSCoordinateModel {
    
    func updateIcons() {
        forEach{$0.updateIcon()}
    }
}
