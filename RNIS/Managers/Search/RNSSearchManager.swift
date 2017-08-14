//
//  RNSSearchManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSSearchManager: NSObject {
    
    var handlerAddress: EmptyBlock?
    var handlerStops: EmptyBlock?
    var handlerTransport: EmptyBlock?
    
    static var text: String?

}
