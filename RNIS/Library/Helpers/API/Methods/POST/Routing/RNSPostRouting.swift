//
//  RNSPOSTRouting.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPostRouting: RNSPostRequest {
    
    @discardableResult convenience init(complete: @escaping APICompletion) {
        self.init()

        showLoader()
        sendRequestWithCompletion(completion: complete)
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
        guard let pointFrom = RNSMapManager.pointFrom,
        let pointHere = RNSMapManager.pointHere else {
            return items
        }
        items.append(contentsOf: [pointFrom.dictionary,
                                  pointHere.dictionary])
        return items
    }
    
    override var subject: String {
        return "com.rnis.geo.action.service.routing"
    }

    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        if showLogApi {
            print("apiDidReturnReply",reply)
        }
        removeLoader()
        guard let model = RNSRequestReply<RNSRoutingPayload, RNISMappableBase>(reply: reply),
            let route = model.payload?.route else {
            superError()
            return
        }
        RNSMapManager.handlerAddRoute?(route)
        super.apiDidReturnReply(route, source: source)
   }
}
