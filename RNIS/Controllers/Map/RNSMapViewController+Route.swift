//
//  RNSMapViewController+Route.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    func addRoute(_ route: PGPolyline?) {
        self.route?.remove()
        self.route = route
    }
}
