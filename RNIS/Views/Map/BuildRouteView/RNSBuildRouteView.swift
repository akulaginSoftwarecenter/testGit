//
//  RNSBuildRouteView.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление для построения маршрута
 */
class RNSBuildRouteView: BaseViewWithXIBInit {
    
    /// точка инициализации
    var point: PGGeoPoint?
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    /// Метод инициализации класса
    @discardableResult convenience init(_ point: PGGeoPoint?) {
        self.init(frame: CGRect.zero)
        
        self.point = point
        animateShow()
    }
    /// Функция удаления старого пина
    func remove() {
        RNSMapManager.removeOldPinBuild()
        self.removeFromSuperview()
    }
    /// переменная точки построения "от"
    var pointFrom: RNSDutyAddressTemp? {
        return RNSMapManager.pointFrom
    }
    /// переменная точки построения "до"
    var pointHere: RNSDutyAddressTemp? {
        return RNSMapManager.pointHere
    }
    /// Функция отображения контроллера выбора точек
    func showPageRoute() {
        let vc = RNSDutyViewController.initialControllerType()
        vc?.loadStartItems(pointFrom, inItem: pointHere)
        vc?.pushAnimatedRed()
        removeAnimate()
    }
}
