//
//  RNSBusManager+Stub.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusManager {
    
    static func prepareStubAsunc() {
        removeOldAll()
        createStubItemsAsync { (items) in
            print("createBussAsync", items?.count as Any)
        }
    }
    
    static func createStubItemsAsync(complete: AliasStringArrayBlock?) {
        RNSDataManager.removeAllBuss()
        //CounterTime.startTimer()
        createStubDicts { (dicts) in
            //CounterTime.endTimer()
            RNSDataManager.parseBusItemsAsync(dicts, complete: { (items) in
                //CounterTime.endTimer()
                complete?(items)
            })
        }
    }
    
    static func createStubDicts(complete: (([AliasDictionary]) -> ())?) {
        var dicts = [AliasDictionary]()
        
       // CounterTime.startTimer()
        let point = redPlaceLocation.coordinate.point
        DispatchQueue.global(qos: .userInitiated).async {
            for index in 7...3000 {
                let lat = point.latitude - 0.2 + (Double(Int.rand(0, limit: 4000))/10000)
                let lon = point.longitude - 0.25 + (Double(Int.rand(0, limit: 5000))/10000)
                
                dicts.append(["route_number":"\(index)",
                              "uuid": "\(index)",
                    "latitude": lat,
                    "longitude" : lon])
            }
            Utils.mainQueue {
                complete?(dicts)
            }
        }
    }
}
