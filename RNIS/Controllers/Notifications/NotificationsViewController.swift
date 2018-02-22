//
//  NotificationsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 NotificationsViewController
 */
class NotificationsViewController: UIViewController {
    
    /// массив моделей нотификаций
    var items: [RNSNotificationModel]?
    /// Представление индикации загрузки
    lazy var loaderWay = RNSLoaderWay()

    /// переменная таблицы
    @IBOutlet weak var tableView: UITableView!
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView();
        prepareHandlers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // Utils.checkEmailShowAlert()
        loadItems()
    }
    
    /// Подписка на клоужеры
    func prepareHandlers() {
        RNSMenuManager.handlerUpdateNotification = { [weak self] in
            self?.loadItems()
        }
    }
}
