//
//  RNSPostStopPointList.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostStopPointList: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    typealias AliasReply = RNSRequestReply<RNSItemsPayload,RNSRegisterError>
    
    override var payload: AliasDictionary {
        return ["left": 55.905883,
                "top": 37.849311,
                "right": 55.573518,
                "bottom": 37.363166]
    }
    
    override var isShowLogReply: Bool {
        return false
    }
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        parseReply(AliasReply(reply: reply), source: source)
    }
    
    func parseReply(_ model: AliasReply?, source: AnyObject) {
        if  model?.success ?? false,
            let items = model?.payload?.items {
            print("RNSPostStopPointList",items.count)
            CounterTime.endTimer()
            RNSDataManager.parseBusStopItemsAsync(items) { (stops) in
                print("stops",stops.count)
                super.apiDidReturnReply(stops as AnyObject, source: source)
            }
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasReply?) {
        guard let item = model?.errors?.first else {
            return
        }
        let error = "Ошибка загрузки остановок. " + item.textError
        STRouter.showAlertOk(error)
        super.apiDidFailWithError(item.error)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.stop_point.list"
    }
}
