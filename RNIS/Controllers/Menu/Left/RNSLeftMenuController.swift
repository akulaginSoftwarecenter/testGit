//
//  MenuViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit
import Social

/**
 Контроллер меню
 */
class RNSLeftMenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /// Массив моделей пунктов меню
    var menuItems: [MenuItem] {
        return RNSMenuManager.menuItems
    }
    @IBOutlet weak var backLoaderView: UIView!
    /// Надпись с именем пользователя
    @IBOutlet weak var nameLabel: UILabel!
    /// Надпись с телефоном пользователя
    @IBOutlet weak var phoneLabel: UILabel!
    /// Представления с фото профиля
    @IBOutlet weak var profileImageView: UIImageView!
    /// Кнопка перехода к редактированию профиля
    @IBOutlet weak var editButton: UIButton!
    /// Таблица с пунктами меню
    @IBOutlet weak var tableView: UITableView!
    /// Индикатор загрузки
    lazy var loaderView = LoaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
        prepareHandlers()
    }
    
    /// Настройка представлений
    func prepareUI() {
        profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        profileImageView.layer.masksToBounds = true
        editButton.layer.cornerRadius = self.editButton.frame.width / 2
        tableView.tableFooterView = UIView();
        prepareProfile()
    }
    
    /// Настройка обработчика обновления меню
    func prepareHandlers() {
        RNSMenuManager.handlerLeftMenuUpdate = { [weak self] in
            self?.prepareProfile()
        }
    }
    
    override class var storyboardName: String {
        return "RNSLeftMenuController"
    }
}
