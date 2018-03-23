//
//  RNSBuildRouteView+Animation.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с анимацией
 */
extension RNSBuildRouteView {
    /// Функция появления анимации
    func animateShow() {
        show()
        animateBottom(true)
    }
    
    /// функция появления вью
    func show() {
        mapHideOldPopopovers()
        guard let view = STRouter.rootView else {
            return
        }
        view.addSubview(self)
        self.autoPinEdgesToSuperviewEdges()
        alpha = 0;
        animateAlpha(1)
    }
    /// Функция скрытия всех старых поповеров
    func mapHideOldPopopovers() {
        RNSMapManager.hideOldPopopovers()
    }
    /// Функция активации нижнего констрейнта
    func animateBottom() {
        UIView.animateConstrains(self) {
            self.bottomConstraint.isActive = true
        }
    }
    /// Функция удаления анимации
    func removeAnimate() {
        animateBottom(false)
        animateAlpha(0, complete: remove)
    }
    /// Функция анимации изменения альфа канала
    func animateAlpha(_ alpha: CGFloat, complete: EmptyBlock? = nil) {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = alpha
        }) { (_) in
            complete?()
        }
    }
    /// Функция изменения активации нижнего констрейнта
    func animateBottom(_ value: Bool) {
        UIView.animateConstrains(self) {
            self.bottomConstraint.isActive = value
        }
    }
}
