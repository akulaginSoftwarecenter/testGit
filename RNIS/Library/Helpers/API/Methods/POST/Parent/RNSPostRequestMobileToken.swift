//
//  RNSPostRequestMobileToken.swift
//  RNIS
//
//  Created by Артем Кулагин on 28.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostRequestMobileToken: RNSRequest {
    
    override var headers: AliasDictionary {
        return super.headers.merged(with: Utils.mobileToken)
    }
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
}
