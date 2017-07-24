//
//  PGGeoPoint+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension PGGeoPoint {
    var dictionary: AliasDictionary {
        return ["latitude": latitude,
                "longitude": longitude]
    }
}
