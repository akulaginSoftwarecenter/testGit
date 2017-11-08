//
//  MapButtonsAnimator.swift
//  RNIS
//
//  Created by Admin on 04.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/// Менеджер анимации кнопок на карте
class MapButtonsAnimator {
    
    private var didSetup = false
    private unowned var view: UIView
    private var showingButtonsConstraints: [NSLayoutConstraint]!
    private var hidingButtonsConstraints: [NSLayoutConstraint]!
    private var duration: TimeInterval
    private var usingSpringAnimation: Bool
    /// Блок с дополнительными анимируемыми изменениями
    /// Принимает параметр, указывающий состояние видимости
    var extraAnimationsWithVisibilityStateHidden: ((Bool)->())?
    
    /// Создание аниматора
    ///
    /// - Parameters:
    ///   - superview: родительское представление
    ///   - duration: длительность анимации
    ///   - usingSpringAnimation: параметр указывает нужно ли использовать анимацию "пружинки"
    init(superview: UIView, duration: TimeInterval, usingSpringAnimation: Bool) {
        view = superview
        self.duration = duration
        self.usingSpringAnimation = usingSpringAnimation
    }
    
    /// Установка основных параметров. Будет выполнена только один раз. Все последующие вызовы данного метода будут игнорироваться.
    ///
    /// - Parameters:
    ///   - showingConstraints: массив ограничителей для демонстрации кнопок
    ///   - hidindConstraints: массив ограничителей для того, чтобы спрятать кнопки
    ///   - hidden: изначальное состояние видимости кнопок
    func setupOnce(_ showingConstraints: [NSLayoutConstraint], _ hidindConstraints: [NSLayoutConstraint], initialVisibilityStateHidden hidden: Bool) {
        guard !didSetup else { return }
        didSetup = true
        showingButtonsConstraints = showingConstraints
        hidingButtonsConstraints = hidindConstraints
        setMapButtons(hidden: hidden)
    }
    
    /// Изменение состояния видимости кнопок
    ///
    /// - Parameters:
    ///   - hidden: параметр указывает нужно ли спрятать или показать
    ///   - animated: параметр указывает нужно ли нужно ли анимировать изменения
    func setMapButtons(hidden: Bool, animated: Bool = false) {
        view.layoutIfNeeded()
        updateConstraints(withVisibilityStateHidden: hidden)
        if animated {
            if usingSpringAnimation {
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    self.view.layoutIfNeeded()
                    self.extraAnimationsWithVisibilityStateHidden?(hidden)
                }, completion: nil)
            }
            else {
                UIView.animate(withDuration: duration, animations: {
                    self.view.layoutIfNeeded()
                    self.extraAnimationsWithVisibilityStateHidden?(hidden)
                })
            }
        }
        else { extraAnimationsWithVisibilityStateHidden?(hidden) }
    }
    
    /// Обновить ограничители
    ///
    /// - Parameter hidden: состояние видимости кнопок
    func updateConstraints(withVisibilityStateHidden hidden: Bool) {
        guard let showingConstraints = showingButtonsConstraints, let hidingConstraints = hidingButtonsConstraints else { return }
        if hidden {
            showingConstraints.forEach({ $0.isActive = !hidden })
            hidingConstraints.forEach({ $0.isActive = hidden })
        }
        else {
            hidingConstraints.forEach({ $0.isActive = hidden })
            showingConstraints.forEach({ $0.isActive = !hidden })
        }
    }
}
