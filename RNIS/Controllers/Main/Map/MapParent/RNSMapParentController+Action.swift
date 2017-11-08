//
//  RNSMapParentController+Action.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для обработки нажатий на кнопки карты
extension RNSMapParentController {
    
    /// Событие нажатия на кнопку компаса
    @IBAction func compasAction(_ sender: Any) {
        setMapRegime(0)
        Utils.delay(0.2) {
            self.setMapRegime(1)
        }
    }

    /// Событие нажатия на кнопку меню
    @IBAction func menuAction(_ sender: Any) {
        RNSMenuManager.showLeftMenu()
    }

    /// Событие нажатия на кнопку поиска
    @IBAction func searchAction(_ sender: Any) {
        RNSSearchViewController.initialPushAnimatedRed()
    }
    
    /// Событие нажатия на кнопку увеличения зума карты
    @IBAction func plusAction(_ sender: Any) {
        mapView.zoomIn()
    }
    
    /// Событие нажатия на кнопку уменьшения зума карты
    @IBAction func minusAction(_ sender: Any) {
        mapView.zoomOut()
    }
    
    /// Событие нажатия на кнопку "показать меня на карте"
    @IBAction func userLocationAction(_ sender: Any) {
        RNSMapManager.startLocation()
    }
}
