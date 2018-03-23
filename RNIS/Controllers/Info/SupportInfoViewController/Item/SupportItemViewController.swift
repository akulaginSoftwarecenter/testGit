//
//  SupportItemViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 16.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Контроллер для отправки сообщения в поддержку
 */
class SupportItemViewController: UIViewController {
    
    var enterViewController: SupportInfoViewController?
    var type: RNSPetitionType = .feedback
    var titleName: String?
    var nameText: String?
    /// переменная уникальный идентификатор сущности
    var uuid: String?
    /// Функция подготовки контейнера
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        enterViewController = segue.destination as? SupportInfoViewController
        prepareEnterViewController()
        segue.destination.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func prepareEnterViewController() {
        enterViewController?.type = type
        enterViewController?.isShowNameSupport = true
        enterViewController?.titleName = titleName
        enterViewController?.nameText = nameText
        enterViewController?.handlerBody = { [weak self] (message) in
            return self?.body(message)
        }
    }
    
    func body(_ message: String?) -> String? {
        return "\(titleName ?? "") \(nameText ?? ""), id \(uuid ?? ""). Сообщение: \(message ?? "")"
    }
    /// Переменная имени сториборда инициализации вьюконтроллера
    override class var storyboardName: String {
        return "SupportInfoViewController"
    }
}
