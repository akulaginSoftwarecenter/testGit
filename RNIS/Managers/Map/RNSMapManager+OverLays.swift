//
//  RNSMapManager+OverLays.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapManager {
    
    static func addOverlay(_ obj: Any) {
        handlerAddOverlay?(obj)
    }
    
    static func removeOverlay(_ obj: Any) {
        handlerRemoveOverlay?(obj)
    }
    
    static func showInfoIfNeed(_ item: RNSCoordinateModel?) {
        handlerShowInfo?(item)
    }
}
