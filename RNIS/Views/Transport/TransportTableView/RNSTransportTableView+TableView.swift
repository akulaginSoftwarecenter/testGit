//
//  RNSTransportTableView+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Класс создание таблицы вида для ТС
 */
extension RNSTransportTableView: UITableViewDelegate, UITableViewDataSource {
    
    /// Указание количества строк таблицы по секциям
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    /// Создание ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSTransportTableViewCell
        cell.item = item(indexPath)
        return cell
    }
    
    /// Выбор индекса элемента таблицы
    func item(_ indexPath: IndexPath) -> RNSRouteVariant? {
        return items?[indexPath.row]
    }
    
    /// Задание высоты каждой ячейки таблицы
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return item(indexPath)?.heightDotsVerticalModel ?? 0
    }
    
    /// Действие при выборе ячейки таблицы
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.item(indexPath)
        RNSMoveMapViewController.initController(item)?.pushAnimated()
    }
}
