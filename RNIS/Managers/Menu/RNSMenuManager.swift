//
//  RNSMenuManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMenuManager: NSObject {
    
    static var handlerShowLeftMenu: EmptyBlock?
    
    static func showLeftMenu() {
        handlerShowLeftMenu?()
    }
}
