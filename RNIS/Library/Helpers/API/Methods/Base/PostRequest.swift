//
//  PostRequest.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import Alamofire

class PostRequest: AlamofireAPI {
    
    override var method: Alamofire.HTTPMethod {
        return .post
    }
}
