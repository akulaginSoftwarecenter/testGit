//
//  RNSRegistrationPhoneController.swift
//  RNIS
//
//  Created by Артем Кулагин on 31.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegistrationPhoneController: RNSPhoneContrainerController {
    
    override var titleTextTop: String {
        return kRegistration
    }
    
    override func actionNext() {
        print("RNSRegistrationPhoneController ",phoneText)
    }
}
