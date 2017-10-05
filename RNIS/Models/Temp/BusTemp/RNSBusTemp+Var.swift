//
//  RNSBusTemp+Var.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusTemp {
    
    var title: String {
        return "A" + "\(route_number ?? 0)"
    }
    
    var tableModel: RNSBusTableModel {
        return RNSBusTableModel(self)
    }
}
