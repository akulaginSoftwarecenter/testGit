//
//  RNSDotsBussVertical+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Класс создание таблицы отображения движения ТС
 */

extension RNSDotsBussVertical: UITableViewDelegate, UITableViewDataSource {
    
    /// Указание количества строк таблицы по секциям
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    /// Создание ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSDotsVerticalCell
        cell.item = item(indexPath)
        return cell
    }
    
    /// Выбор индекса элемента таблицы
    func item(_ indexPath: IndexPath) -> RNSVerticalTableItem {
        return items[indexPath.row]
    }
}
