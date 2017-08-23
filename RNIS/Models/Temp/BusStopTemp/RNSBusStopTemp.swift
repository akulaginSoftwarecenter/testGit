//
//  RNSBusStopTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusStopTemp: RNISMappableBase, RNSTextItem  {
    var text: String?
    
    convenience init(_ text: String?) {
        self.init()
        
        self.text = text
    }
}
