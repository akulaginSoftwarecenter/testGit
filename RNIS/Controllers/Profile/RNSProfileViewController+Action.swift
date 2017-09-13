//
//  RNSProfileViewController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSProfileViewController {
    
    @IBAction func actionPhone(_ sender: Any) {
        RNSChangePhoneController.controller.pushAnimatedImageScroll()
    }
    
    @IBAction func actionPassword(_ sender: Any) {
        RNSChangePasswordController.initialController.pushAnimatedImageScroll()
    }
}
