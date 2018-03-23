//
//  AddressHistoryView.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Класс отображения истории поиска
 */
class RNSAddressHistoryView: BaseViewWithXIBInit {

    /// Ограничение высоты таблицы
     @IBOutlet var heightTableView: NSLayoutConstraint?
    /// Таблица вариантов адресов (автокомплит)
    @IBOutlet weak var tableView: UITableView!
    
    var handlerItem: ((RNSSearchHistory?) -> ())?
    
    /// массив моделей истории поиска
    var items: [RNSSearchHistory]?
    
    /// Обновление содержимого таблицы и размеров
    func prepare(_ text: String?) {
        self.items = RNSDataManager.searchItems(text)?.reversed()
        tableView.reloadData()
        heightTableView?.constant = tableView.tableViewContentSize
    }
    
    /// функция появления вью
    func show() {
        prepareVisible(false)
    }
    
    /// функция исчезновения вью
    func hidden() {
        prepareVisible(true)
    }
    
    /// функция исчезновения или появления вью
    func prepareVisible(_ isHidden: Bool) {
        self.isHidden = isHidden
        heightTableView?.isActive = !isHidden
    }
}
