//
//  RNSMapManager+Rabanc.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapManager {
    
    static func showRabanc(_ item: RNSBusTemp?) {
        print("showRabanc1")
         print("showRabanc2",Utils.dictToJson("rabanc"))
        guard let json = Utils.dictToJson("rabanc") as? AliasDictionary else {
            return
        }
        let route = RNSRabanc(JSON: json)
        print("showRabanc",route?.points?.first?.latitude)
    }
}
