//
//  RNSMenuBarItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMenuBarItem: UIBarButtonItem {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        target = self
        action = #selector(actionTap)
    }
    
    func actionTap() {
        RNSMenuManager.showLeftMenu()
    }
}
