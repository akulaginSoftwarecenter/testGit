//
//  RNSPostSearch+Type.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPostSearch {
    
    func parseAtType(_ dicts: [AliasDictionary]) {
        guard let type = type else {
            return
        }
        var items = [Any]()
        switch type {
        case .transport:
            items = dicts.flatMap{ RNSBusStopTemp(JSON: $0) }
            break
        case .stop:
            break
        case .address:
            break
        }
        complete?(items)
    }
}