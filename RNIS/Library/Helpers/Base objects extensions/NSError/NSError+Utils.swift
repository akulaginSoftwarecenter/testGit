//
//  NSError+Utils.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для NSError
 */
extension NSError {
    
    var isLostInet: Bool {
        return code == -1009
    }
}
