//
//  RNSMapManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMapManager: NSObject {

    static var handlerAddOverlay: AnyBlock?
    static var handlerRemoveOverlay: AnyBlock?
    
    static func removeOldPinBuild() {
        handlerRemovePinBuild?()
    }
    static var handlerRemovePinBuild: EmptyBlock?
    static var handlerAddRoute: ((PGPolyline?) -> ())?
    
}
