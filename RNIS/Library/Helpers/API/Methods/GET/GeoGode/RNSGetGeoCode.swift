//
//  RNSGetGeoCode.swift
//  RNIS
//
//  Created by Артем Кулагин on 17.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

/**
 Запрос получения адресов
 */
class RNSGetGeoCode: AlamofireAPI {
    
    /// точка инициализации
    var point: PGGeoPoint?
    
    /// Метод инициализации 
    @discardableResult convenience init(_ point: PGGeoPoint?, complete: AliasStringBlock?) {
        self.init()
        
        self.point = point
        sendRequestWithCompletion { (object, error, inot) in
            complete?(object as? String)
        }
    }
    
    override var path: String {
        return mapHost3 + "search/"
    }
    
    override var parameters: [String : Any] {
        guard let point = point else {
                return super.parameters
        }
        return ["a": "geocode",
                "lat": point.latitude,
                "lon": point.longitude,
                "is_addr": 1,
                "n": 1]
    }
    
    override func prepareURLRequest(_ request: URLRequest) -> URLRequest{
        var mutableRequest = super.prepareURLRequest(request)
        do {
            mutableRequest = try URLEncoding.queryString.encode(mutableRequest, with: parameters)
        } catch {
            // Handle error
        }
        return mutableRequest
    }
    
    override func apiDidReturnReply(_ reply: AnyObject, source: AnyObject){
        guard let dict = reply as? AliasDictionary,
            let res = dict["res"] as? [AliasDictionary],
            let addr =  res.first?["addr"] as? String else {
                STAlertRouter.showOk("Сервер не отвечает")
                superError()
                return
        }
        super.apiDidReturnReply(addr as AnyObject, source: source)
    }
    
    override func superError() {
        super.apiDidFailWithError(NSError(domain: "Не удалось получить информацию о адресе", code: 0, userInfo: [:]))
    }
}
