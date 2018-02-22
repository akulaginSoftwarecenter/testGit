//
//  NewsViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы c таблицей
 */
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    /// Метод возврата количества строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    /// Метод возврата строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSNewsCell
        cell.item = item(indexPath)
        return cell
    }
    
    /// Получение текста адреса по индексу ячейки в таблице
    ///
    /// - Parameter indexPath: индекс ячейки в таблице
    /// - Returns: текст адреса
    func item(_ indexPath: IndexPath) -> RNSNewsTemp? {
        return items?.valueAt(indexPath.row)
    }
    
    /// Метод обработки строки по тапу
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = item(indexPath) else {
           return
        }
        
        let vc = RNSNewsDetailController.initController(item)
        vc?.pushAnimated()
    }
}
