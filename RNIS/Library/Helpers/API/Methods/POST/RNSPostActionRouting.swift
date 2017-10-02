//
//  RNSPostActionRouting.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostActionRouting: RNSRequest {
    
    var from: RNSDutyAddressTemp?
    var to: RNSDutyAddressTemp?
    var date: Date?
    
    var complete: EmptyBlock?
    var failure: AliasStringBlock?
    
    typealias AliasReply = RNSRequestReply<RNISMappableBase,RNSRegisterError>
    
    @discardableResult convenience init(_ from: RNSDutyAddressTemp?, to: RNSDutyAddressTemp?, date: Date?, complete: EmptyBlock?, failure: AliasStringBlock? = nil) {
        self.init()
        
  
        self.from = from
        self.to = to
        self.date = date
        self.complete = complete
        self.failure = failure
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            complete?()
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false {
            
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasReply?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        failure?(error)
    }
    
    override var payload: AliasDictionary {
        guard let from = from,
            let to = to else {
                return [:]
        }
        var dict:AliasDictionary = ["from": from.toJSON(),
                                    "to": to.toJSON()]
        if let time = date?.timeIntervalSince1970  {
            dict["date"] = time
        }
        return dict
    }
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.routing"
    }
}
