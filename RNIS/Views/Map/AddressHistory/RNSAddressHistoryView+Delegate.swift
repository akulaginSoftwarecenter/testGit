//
//  RNSAddressHistoryView+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 23.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSAddressHistoryView: UITableViewDelegate, UITableViewDataSource {
    
    /// Массив объектов из истории адресов, который служит для заполнения таблицы
    var items: [RNSSearchHistory]? {
        return RNSDataManager.searchItems(text)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSAddressCell
        cell.item = item(indexPath)
        return cell
    }
    
    /// Получение текста адреса по индексу ячейки в таблице
    ///
    /// - Parameter indexPath: индекс ячейки в таблице
    /// - Returns: текст адреса
    func item(_ indexPath: IndexPath) -> String? {
        return items?.valueAt(indexPath.row)?.title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RNSAddressCell, let item = cell.item else {
            return
        }
        handlerAddress?(item)
    }
}
