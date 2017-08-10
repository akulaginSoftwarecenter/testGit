//
//  RNSScrollShowContainer+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSScrollShowContainer {
    
    @IBAction func actionCross(_ sender: Any) {
        startOverTopDeselerateFalse()
        scrollToStart()
    }
    
    @IBAction func actionTop(_ sender: Any) {
        scrollToTop(true)
    }
}
