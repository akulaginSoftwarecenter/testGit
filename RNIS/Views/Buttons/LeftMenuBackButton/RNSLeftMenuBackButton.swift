//
//  RNSLeftMenuBackButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Left Menu Back Button
 */

class RNSLeftMenuBackButton: RNSLeftBackButton {
     override func actionTouch() {
        RNSMenuManager.showLeftMenu()
     }
}
