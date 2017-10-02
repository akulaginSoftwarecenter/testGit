//
//  RNSPostSearch.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostSearch: RNSRequest {
    
    var text: String?
    var type: TypeSearch?
    
    var complete: AnyItemsBlock?
    var failure: AliasStringBlock?
    
    typealias AliasReply = RNSRequestReply<RNSItemsPayload,RNSRegisterError>
    
    @discardableResult convenience init(_ text: String?, type: TypeSearch?, complete: AnyItemsBlock?, failure: AliasStringBlock? = nil) {
        self.init()
        
        
        self.text = text
        self.type = type
        self.complete = complete
        self.failure = failure
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false,
            let items = model?.payload?.items {
            parseAtType(items)
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
        guard let type = type else {
            return [:]
        }
        return ["query": text ?? "",
                "type": type.guery]
    }
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.search"
    }
 
}
