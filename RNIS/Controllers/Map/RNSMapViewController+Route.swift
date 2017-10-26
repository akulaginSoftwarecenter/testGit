//
//  RNSMapViewController+Route.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSMapViewController {
    
    /// Добавить маршрут на карту
    ///
    /// - Parameter route: маршрут
    func addRoute(_ route: PGPolyline?) {
        self.route?.remove()
        self.route = route
    }
}
