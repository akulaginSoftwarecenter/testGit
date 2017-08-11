//
//  RNSNameFieldLeft.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSNameFieldLeft: RNSNameField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        bottomLineOffset = 6
        leftTextAlignment = true
    }
}
