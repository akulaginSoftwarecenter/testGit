//
//  RNSDataManager+Search.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

extension RNSDataManager {
    
    static var searchItems: Results<RNSSearchHistory>? {
        return realm?.objects(RNSSearchHistory.self)
    }
    
    static func createSearchItem(_ text: String) {
        write({
            let item = RNSSearchHistory()
            item.title = text
            realm?.add(item)
        })
    }
}
