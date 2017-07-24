//
//  RNSPOSTRouting.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPOSTRouting: RNSPostRequest {
    
    var point: PGGeoPoint?
    
    @discardableResult convenience init(_ point: PGGeoPoint?) {
        self.init()
        
        self.point = point
        sendRequest()
    }
    
    override var headers: AliasDictionary {
        var headers = super.headers
        if let token = UserDefaults.token {
            headers["token"] = "\(token)"
        }
        return headers
    }
    
    override var payload: AliasDictionary {
        return ["points":points]
    }
    
    var points: [AliasDictionary] {
        var items =  [AliasDictionary]()
        guard let point = point else {
            return items
        }
        items.append(contentsOf: [point.dictionary,
                                  RNSLocationManager.point.dictionary])
        return items
    }
    
    override var subject: String {
        return "com.rnis.geo.action.service.routing"
    }

    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        print("apiDidReturnReply",reply)
        removeLoader()
        guard let model = RNSRequestReply<RNSRoutingPayload>(reply: reply) else {
            superError()
            return
        }
        guard let distance = model.payload?.distance else {
            return
        }
        print("RNSPOSTRouting",distance)
    }
}
