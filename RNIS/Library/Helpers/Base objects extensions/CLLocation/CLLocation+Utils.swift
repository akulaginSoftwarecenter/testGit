//
//  CLLocation+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для CLLocation
 */
extension CLLocation {
    var point: PGGeoPoint {
        return coordinate.point
    }
}
