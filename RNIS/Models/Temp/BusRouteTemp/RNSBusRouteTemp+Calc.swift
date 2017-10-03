//
//  RNSBusRouteTemp+Calc.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusRouteTemp {
    
    func prepareTitle() {
        self.title = "A" + "\(number ?? "")"
    }
    
    var titleWidth: CGFloat {
        return (title?.width(.cffazm20) ?? 20) + 22
    }
}
