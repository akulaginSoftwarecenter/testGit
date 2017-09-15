//
//  RNSLeftMenuController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSLeftMenuController {
    
    @IBAction func actionProfile(_ sender: Any) {
        RNSMenuManager.showProfile()
    }
    
    @IBAction func testAction(_ sender: Any) {
        RNSBusStopManager.prepareStubAsunc()
    }
    
    @IBAction func testBuss(_ sender: Any) {
        RNSBusManager.prepareStubAsunc()
    }
}
