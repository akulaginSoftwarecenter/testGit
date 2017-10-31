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
        
        sendRequestWithCompletion { (object, error, inot) in
            Utils.queueUserInitiated {
                let model = AliasReply(reply: object as AnyObject)
                Utils.mainQueue {
                    self.parseReply(model)
                }
            }
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
}
