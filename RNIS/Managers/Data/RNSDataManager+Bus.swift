//
//  RNSDataManager+Bus.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

extension RNSDataManager {
    
    static var bussReal: [RNSBus]? {
        return bussAll?.filter{ $0.isHaveCoordinate }
    }
    
    static var bussAll: Results<RNSBus>? {
        return realm?.objects(RNSBus.self)
    }
    
    static func createStubBusIfNeed() {
         write({
            if let items = bussAll {
                realm?.delete(items)
            }
            
            let item = RNSBus()
            item.stubBus()
            realm?.add(item)
        })
    }
    
    static func generateBusList(complete: (([RNSBus])->())? ) {
        var items = [RNSBus]()
        write({
            for _ in 0...Int.rand(1, limit: 20) {
                let item = RNSBus()
                item.generate()
                realm?.add(item)
                items.append(item)
            }
        }, complete: {
            Utils.delay(2) {
                complete?(items)
            }
        })
    }
}
