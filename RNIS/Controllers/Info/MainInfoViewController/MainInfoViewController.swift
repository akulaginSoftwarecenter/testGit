//
//  MainInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер для демонстрации информационных разделов
 */
class MainInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let main_to_contacts = "main_to_contacts"
    
    /// Список заголовков разделов
    let menuTitles = ["Полезные контакты",
                      "Забытые вещи",
                      "Сканер QR",
                      "Пожаловаться",
                      "Связь с разработчиком" ,
                      "Руководство пользователя",
                      "Пользовательское соглашение",
                      "О приложении"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsetsMake(16, 0, 0, 0);
    }

    /// Показать контроллер выбранного раздела
    ///
    /// - Parameter type: тип раздела
    func showDocsInfo(_ type: RNSDocsType) {
        let vc = DocsInfoViewController.initialControllerType()
        vc?.type = type
        vc?.pushAnimatedRed()
    }
    
    /// Показать контроллер информации о контактах
    ///
    /// - Parameter type: тип контакта
    func showContact(_ type: RNSContactInfoType) {
        let vc = ContactsInfoViewController.initialControllerType()
        vc?.type = type
        vc?.pushAnimatedRed()
    }
    
    /// Показать контроллер обращения к разработчикам
    ///
    /// - Parameter type: тип обращения
    func showPetition(_ type: RNSPetitionType = .feedback) {
        let vc = SupportInfoViewController.initialControllerType()
        vc?.type = type
        vc?.pushAnimatedRedScroll()
    }
    
    override class var storyboardName: String {
        return "MainInfoViewController"
    }
}
