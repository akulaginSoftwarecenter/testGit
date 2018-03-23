//
//  RNSBuildRouteView+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для обработки некоторых событий
 */
extension RNSBuildRouteView {
    /// Обработка события нажатия на кнопку удаления
    @IBAction func removeAction(_ sender: Any) {
        removeAnimate()
    }
    /// Обработка события нажатия на кнопку ОТ
    @IBAction func actionFrom(_ sender: Any) {
        RNSMapManager.pointFrom = RNSDutyAddressTemp(point)
        showPageRoute()
        //requestRoute()
     }
    /// Обработка события нажатия на кнопку ДО
    @IBAction func actionHere(_ sender: Any) {
        RNSMapManager.pointHere = RNSDutyAddressTemp(point)
        showPageRoute()
        //requestRoute()
    }
}
