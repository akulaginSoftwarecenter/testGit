//
//  RNSPostСontactList.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostContactList: RNSRequest {
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var failure: AliasStringBlock?
    var complete: AliasRegisterPayloadBlock?
    
    @discardableResult convenience init(_ item: RNSRegisterPayload?, complete: AliasRegisterPayloadBlock?, failure: AliasStringBlock?) {
        self.init()
        /*
        self.item = item
        self.failure = failure
        self.complete = complete
        STRouter.showLoader()
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            STRouter.removeLoader()
            self?.parseReply(AliasPostRegister(reply: object))
        }
 */
    }
}
