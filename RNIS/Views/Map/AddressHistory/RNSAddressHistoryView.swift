//
//  AddressHistoryView.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

class RNSAddressHistoryView: BaseViewWithXIBInit {

    /// Ограничение высоты таблицы
     @IBOutlet var heightTableView: NSLayoutConstraint?
    /// Таблица вариантов адресов (автокомплит)
 
    @IBOutlet weak var tableView: UITableView!
    
    var handlerItem: ((RNSSearchHistory?) -> ())?
    
    var items: [RNSSearchHistory]?
    
    /// Обновление содержимого таблицы и размеров
    func prepare(_ text: String?) {
        self.items = RNSDataManager.searchItems(text)?.reversed()
        tableView.reloadData()
        heightTableView?.constant = tableView.tableViewContentSize
    }
    
    func show() {
        prepareVisible(false)
    }
    
    func hidden() {
        prepareVisible(true)
    }
    
    func prepareVisible(_ isHidden: Bool) {
        self.isHidden = isHidden
        heightTableView?.isActive = !isHidden
    }
}
