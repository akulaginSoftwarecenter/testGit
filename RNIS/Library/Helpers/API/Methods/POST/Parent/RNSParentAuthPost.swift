//
//  RNSParentPost.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSParentAuthPost: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var item: RNSRegisterPayload?
    var failure: AliasStringBlock?
    var complete: AliasRegisterPayloadBlock?
     
    @discardableResult convenience init(_ item: RNSRegisterPayload?, complete: AliasRegisterPayloadBlock?, failure: AliasStringBlock?) {
        self.init()
        
        self.item = item
        self.failure = failure
        self.complete = complete
        STRouter.showLoader()
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            STRouter.removeLoader()
            self?.parseReply(AliasPostRegister(reply: object))
        }
    }
    
    func parseReply(_ model: AliasPostRegister?) {
        if  model?.success ?? false {
            complete?(model?.payload)
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasPostRegister?) {
        guard let error = model?.errors?.first?.textError else {
            return
        }
        failure?(error)
    }
    
    override var payload: AliasDictionary {
        guard let item = item else {
            return [:]
        }
        return item.toJSON()
    }
}
