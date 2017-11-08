//
//  RNSFavoritesBusCell+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Класс создание ячейки таблицы для избранных маршрутов
 */
extension RNSFavoritesBusCell: UITableViewDelegate, UITableViewDataSource {
    
    /// Указание количества строк таблицы по секциям
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    /// Создание ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSForecastCell
        cell.item = item(indexPath)
        return cell
    }
    
    /// Выбор индекса элемента таблицы
    func item(_ indexPath: IndexPath) -> RNSForecastBus? {
        return items?[indexPath.row]
    }
}
