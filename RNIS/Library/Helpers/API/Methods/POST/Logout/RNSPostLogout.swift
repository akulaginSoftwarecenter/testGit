//
//  RNSPostLogout.swift
//  RNIS
//
//  Created by Артем Кулагин on 24.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class RNSPostLogout: RNSTokenRequest {
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
    
    override var subject: String {
        return "com.rnis.auth.action.logout"
    }
}
