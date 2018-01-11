//
//  RNSPostMobilePageGet.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostMobilePageGet: RNSRequest {
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    override var cashed: Bool {
        return true
    }
    
    var complete: AliasComplete?
    var failure: AliasStringBlock?
    var type: RNSDocsType = .userGuide
    
    typealias AliasPayload = RNSMobilePagePayload
    typealias AliasReply = RNSRequestReply<AliasPayload,RNSRegisterError>
    typealias AliasComplete = (AliasPayload?) -> ()
    
    @discardableResult convenience init(_ type: RNSDocsType, complete: AliasComplete?, failure: AliasStringBlock?) {
        self.init()
        
        self.type = type
        self.complete = complete
        self.failure = failure
        
        if let cacheData = cacheData,
            let model = AliasReply(reply: cacheData),
            model.success ?? false {
            complete?(model.payload)
            return
        }
        
        STRouter.showLoaderEnableUserInteraction()
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            STRouter.removeLoader()
            self?.parseReply(AliasReply(reply: object))
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
        guard let error = model?.errors?.first?.textError else {
            return
        }
        failure?(error)
    }
    
    override var payload: AliasDictionary {
        return ["key": type.rawValue]
    }
    
    override func showErrorNetwork() {
        failure?(errorNetwork)
    }
    
    override var subject: String {
        return "com.rnis.mobile.action.mobile_page.get"
    }
}
