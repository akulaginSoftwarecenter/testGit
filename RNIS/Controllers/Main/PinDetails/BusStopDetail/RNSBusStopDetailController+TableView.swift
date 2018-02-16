//
//  RNSBusStopDetailController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для работы с таблицей
extension RNSBusStopDetailController: UITableViewDelegate, UITableViewDataSource {
    
    /// Настройка таблицы
    func prepareTableView() {
        tableView.reloadData()
        heightTableView.constant = tableView.tableViewContentSize
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSBusStopDetailCell
        let item = self.item(indexPath)
        cell.item = item
        cell.updateNotification = { [weak self] in
            self?.updateNotification(item)
        }
        cell.updateFavorite = { [weak self] in
            self?.updateFavorite(item)
        }
        return cell
    }
    
    /// Получение автобусного маршрута для ячейки с указанным индексом
    ///
    /// - Parameter indexPath: индекс ячейки в таблице
    /// - Returns: модель автобусного маршрута
    func item(_ indexPath: IndexPath) -> RNSBusRouteTemp? {
        return items?[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showLoader(true)
        RNSPostRouteBusList(item(indexPath), busStop: item, complete: { [weak self] in
            self?.removeLoader(true)
        })
    }
}
