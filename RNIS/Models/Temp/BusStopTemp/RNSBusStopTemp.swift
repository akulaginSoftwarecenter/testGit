//
//  RNSBusStopTemp.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusStopTemp: RNSNameMapable, RNSTextItem {
   
    var forecast: [RNSRouteBusTemp]?
    
    var height: CGFloat {
        return CGFloat(45 + (forecast?.count ?? 0) * 49)
    }
}
