//
//  Error+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
    
    var isLostInet: Bool {
        return (self as NSError).isLostInet
    }
}
