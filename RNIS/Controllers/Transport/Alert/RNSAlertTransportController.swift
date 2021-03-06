//
//  RNSAlertTransportController.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер для демонстрации алертов внутри контроллера мой транспорт
 */
class RNSAlertTransportController: UIAlertController {

    /// Модель варианта маршрута
    var item: RNSRouteVariant?
    
    /// Создание контроллера
    ///
    /// - Parameter item: модель варианта маршрута
    static func initController(_ item: RNSRouteVariant?) -> RNSAlertTransportController {
        let vc = RNSAlertTransportController(title: nil, message: nil, preferredStyle: .actionSheet)
        vc.prepareUI()
        vc.item = item
        return vc
    }
    
    /// Настройка действий
    func prepareUI() {
        addAction("Переименовать") { [weak self] in
            self?.showMessageAlert()
        }
        
        addAction("Удалить",style: .destructive) {[weak self] in
            RNSPageRouteManager.removeFavoriteServer(self?.item)
        }
        
        addAction("Отмена", style: .cancel)
    }
    /// Функция подготовки события для алерта
    func addAction(_ title: String?, style: UIAlertActionStyle = .default, complete: EmptyBlock? = nil) {
        addAction(UIAlertAction(title: title, style: style) {action in
            complete?()
        })
    }
    
    /// Показать алерт
    func showMessageAlert() {
        let alert = UIAlertController(title: "Введите название", message: nil, preferredStyle: .alert)
        
        alert.addTextField {[weak self] (textField) in
            textField.text = self?.item?.name
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(_) in
            let textField = alert.textFields![0]
            self.item?.name = textField.text
            RNSPageRouteManager.updateName(self.item)
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        STRouter.present(alert)
    }
}
