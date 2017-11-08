//
//  RNSMapViewController+Present.swift
//  RNIS
//
//  Created by Артем Кулагин on 08.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для презентации контроллеров
extension RNSMapViewController {
    
    /// Функция презентует указанный контроллер. Если в данный момент есть другие презентуемые контроллеры, то они будут удалены.
    ///
    /// - Parameter vc: контроллер для презентации
    func dismissPresent(_ vc: UIViewController?) {
        dismissOldPresentVC {
            self.present(vc)
        }
    }
    
    /// Презентация контроллера путем добавления его прдеставления к своему
    ///
    /// - Parameter vc: контроллер для презентации
    func present(_ vc: UIViewController?) {
        guard let containerVC = vc,
            let containerView = vc?.view else {
                return
        }
        addChildViewController(containerVC)
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
        presentViewController = vc
    }
    
    /// Показывает есть ли в данный момент презентуемые контроллеры
    var isHavePresent: Bool {
        return presentViewController != nil
    }
    
    /// Удаляет все презентованные контроллеры
    ///
    /// - Parameter complete: блок, который будет выполнен после удаления
    func dismissOldPresentVC(complete: EmptyBlock? = nil) {
        presentViewController?.removeFromParentViewController()
        presentViewController?.view.removeFromSuperview()
        presentViewController = nil
        complete?()
    }
}
