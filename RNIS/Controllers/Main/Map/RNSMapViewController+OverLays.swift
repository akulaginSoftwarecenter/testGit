//
//  RNSMapViewController+OverLays.swift
//  RNIS
//
//  Created by Артем Кулагин on 25.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение отображения поповера деталей
 */
extension RNSMapViewController {

    /// Показать контроллер с детальной информацией об автобусе либо остановке
    ///
    /// - Parameter item: модель автобуса либо остановки
    func showInfoIfNeed(_ item: RNSCoordinateModel?) {
        var vc: UIViewController?
        if let item = item as? RNSBus {
            vc = RNSBusDetailController.initController(item)
        }
        if let item = item as? RNSBusStop {
            vc = RNSBusStopDetailController.initController(item)
        }
        dismissPresent(vc)
    }
}
