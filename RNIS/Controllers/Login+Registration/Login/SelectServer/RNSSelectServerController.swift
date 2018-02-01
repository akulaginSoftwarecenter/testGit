//
//  RNSSelectServerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.02.2018.
//  Copyright © 2018 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSSelectServerController: UIAlertController {

    /// Создание контроллера
    ///
    /// - Parameter item: модель варианта маршрута
    static var initController: RNSSelectServerController? {
        let current = "Текущий: \((UserDefaults.serverApi ?? ""))"
        let vc = RNSSelectServerController(title: "Сменить сервер?", message: current, preferredStyle: .actionSheet)
        vc.prepareUI()
        return vc
    }
    
    var items: [String] {
        var items = RNISAuthManager.servers
        if let current = UserDefaults.serverApi,
            let index = items.index(of: current) {
            items.remove(at: index)
        }
        return items
    }
    
    /// Настройка действий
    func prepareUI() {
        for item in items {
            addAction(item) {
                UserDefaults.setServerApi(item)
                RNSMapManager.resetMap()
            }
        }
        addAction("Отмена", style: .cancel)
    }
    
    func addAction(_ title: String?, style: UIAlertActionStyle = .default, complete: EmptyBlock? = nil) {
        addAction(UIAlertAction(title: title, style: style) {action in
            complete?()
        })
    }
}
