//
//  RNSPostNews.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostNews: RNSRequest {
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    typealias CompleteAlias = ([RNSNewsTemp]?) -> ()
    typealias AliasReply = RNSRequestReply<RNSActionRoutingPayload<RNSNewsTemp>,RNSRegisterError>
    
    var complete: CompleteAlias?
    var failure: AliasStringBlock?
    @discardableResult convenience init(complete: CompleteAlias?, failure: AliasStringBlock?) {
        self.init()
        
        self.complete = complete
        self.failure = failure
        
        sendRequestWithCompletion {[weak self] (object, error, inot) in
            self?.parseReply(AliasReply(reply: object))
        }
    }
    
    override var headers: AliasDictionary {
        var dict = super.headers
        dict[kMeta] = AliasDictionary()
        return dict
    }
    
    func parseReply(_ model: AliasReply?) {
        if  model?.success ?? false,
            let items = model?.payload?.items {
            complete?(items)
            return
        }
        parseError(model)
    }
    
    func parseError(_ model: AliasReply?) {
        guard let item = model?.errors?.first else {
            return
        }
        let error = "Ошибка загрузки новостей. " + item.textError
        self.failure?(error)
    }
    
    override func showErrorNetwork() {
        failure?(errorNetwork)
    }
    
    override var subject: String {
        return "com.rnis.portal.action.news"
    }
}
