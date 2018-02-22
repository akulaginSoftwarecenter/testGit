//
//  RNSBus+Stub.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с заглушкой
 */
extension RNSBus {
    
    var stubDictMove: AliasDictionary? {
        var dict = point.coordinate(45, distance: 16)?.dictionary
        dict?[kUuid] = uuid
        return dict
    }
}
