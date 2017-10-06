//
//  RNSPostBusGet.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostBusGet: RNSPostRequestMobileToken {
    var item: RNSBus?
    var complete: AliasComplete?
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    typealias AliasComplete = (RNSBusTemp?) -> ()
    typealias AliasReply = RNSRequestReply<RNSBusTemp,RNSRegisterError>
    
    @discardableResult convenience init(_ item: RNSBus?, complete: AliasComplete?) {
        self.init()
        
        self.item = item
        self.complete = complete
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            /*
            var dict = object as? AliasDictionary
            var payload = dict?["payload"] as? AliasDictionary
            payload?["stop_points"] = self?.convertStops
            dict?["payload"] = payload
 */
            self?.parseReply(AliasReply(reply: object as AnyObject))
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false {
            complete?(model?.payload)
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasReply?) {
        /*
        guard let error = model?.errors?.first?.textError else {
            return
        }
        */
        complete?(nil)
    }
    
    override var payload: AliasDictionary {
        guard let uuid = item?.uuid else {
            return [:]
        }
        return [kUuid: uuid]
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.bus.get"
    }
   
    var convertStops: Any? {
        return Utils.dictToJson("245543")
    }
}
