//
//  RNSPhoneContrainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSPhoneContrainerController: STContainerViewController {
    
    var phoneText: String? {
       return (enterViewController as? RNSPhoneViewController)?.phoneField.last10
    }
    
    override class var storyboardName: String {
        return kPhoneVC
    }
}
