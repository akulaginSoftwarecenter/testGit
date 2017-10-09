//
//  RNSRegularRequest.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSRegularRequest: AlamofireAPI {
    override func prepareURLRequest(_ request: URLRequest) -> URLRequest{
        var mutableRequest = super.prepareURLRequest(request)
        do {
            mutableRequest = try URLEncoding.queryString.encode(mutableRequest, with: parameters)
        } catch {
            // Handle error
        }
        return mutableRequest
    }
}
