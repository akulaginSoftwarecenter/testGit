//
//  RNSPostBusGet.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostBusGet: RNSRequest {
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
    
    var convertStops: AliasDictionary? {
        if let path = Bundle.main.url(forResource: "document", withExtension: "json") {
            print("convertStops path",path)
            do {
                let data = try Data(contentsOf: path, options: .alwaysMapped)
                print("data convertStops",data)
                do {
                    return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch {
                    print(error.localizedDescription)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
