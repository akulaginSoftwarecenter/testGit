//
//  ContactsInfoViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 29.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/// Перечисление с типом контактов
enum RNSContactInfoType: String {
    case contact = "contact"
    case forgotten = "forgotten"
    
    var title: String {
        return self == .contact ? "Полезные контакты" : "Забытые вещи"
    }
}

/**
 Контроллер отображения контактов
 */
class ContactsInfoViewController: UIViewController {
    
    /// Переменная отображения заголовка
    @IBOutlet weak var topTitle: RNSTopTitle!

    /// Переменная отображения таблицы
    @IBOutlet weak var tableView: UITableView!
    /// Представление индикации загрузки
    lazy var loaderWay = RNSLoaderWay()
    
    /// Тип контактов
    var type: RNSContactInfoType = .contact
    
    /// Массив моделей контактов
    var items: [RNSContactItem]?
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTitle.text = type.title
        loadItems()
        tableView.tableFooterView = UIView()
    }
    
    /// Загрузка контактов
    func loadItems() {
        RNSPostContactList(type, complete: { [weak self] item in
            self?.prepareItems(item?.items)
            self?.clearError()
            }, failure: { [weak self] text in
                self?.prepareError(text)
        })
    }
    
    /// Метод отображения ошибок
    func prepareError(_ text: String?) {
        loaderWay.showCenterError(self.view, frame: tableView.frame, text: text)
        prepareItems(nil)
    }
    
    /// Метод очистки ошибок
    func clearError() {
        loaderWay.remove()
    }
    
    /// Метод подготовки массива данных
    func prepareItems(_ items: [RNSContactItem]?) {
        self.items = items
        tableView.reloadData()
    }
}
