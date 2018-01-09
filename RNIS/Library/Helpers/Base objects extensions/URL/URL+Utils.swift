//
//  NSURL+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.01.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import Foundation

extension URL {
    var strNoURLScheme: String? {
        guard let scheme = scheme else {
            return ""
        }
        return  absoluteString.replacingOccurrences(of: scheme + ":", with: "")
    }
    
    var isMail: Bool {
        return absoluteString.contains("@")
    }
}
