//
//  RNSBusDetailWayView+Delegate.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с событиями таблицы
 */
extension RNSBusDetailWayView: UITableViewDelegate, UITableViewDataSource {
    
    /// Метод возврата количества строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsCount
    }
    
    /// Метод возврата строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSBusDetailWayCell
        cell.item = item(indexPath)
        return cell
    }
    
    /// Метод возврата элемена в массиве по индексу
    func item(_ indexPath: IndexPath) -> RNSBusTableItem? {
        return items?[indexPath.row]
    }
    
    /// Метод обработки строки по тапу
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = self.item(indexPath)  else {
            return
        }
 
        if item.isStill {
            item.openStill = !item.openStill
            animateInsertStill(indexPath)
        } else {
            RNSMapManager.showStopPoint(item.dict)
        }
    }
    
    var itemsCount: Int {
        return items?.count ?? 0
    }
}
