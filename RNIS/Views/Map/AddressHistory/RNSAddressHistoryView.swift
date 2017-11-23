//
//  AddressHistoryView.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

class RNSAddressHistoryView: BaseViewWithXIBInit {
    /*
    /// Ограничение таблицы снизу
    @IBOutlet weak var bottomTableView: NSLayoutConstraint!
    /// Ограничение высоты таблицы
 */
    @IBOutlet weak var heightTableView: NSLayoutConstraint!
    /// Таблица вариантов адресов (автокомплит)
 
    @IBOutlet weak var tableView: UITableView!
    
    var handlerAddress: AliasStringBlock?
    
    var text: String?
    
    /// Обновление содержимого таблицы и размеров
    func prepare(_ text: String?) {
        self.text = text
        tableView.reloadData()
        heightTableView.constant = tableView.tableViewContentSize
    }
}
