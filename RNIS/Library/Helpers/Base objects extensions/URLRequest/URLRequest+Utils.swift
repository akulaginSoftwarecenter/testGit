//
//  URLRequest+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension URLRequest {
    
    var isMail: Bool {
        return url?.isMail ?? false
    }
}
