//
//  NewsViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.10.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RNSNewsCell,
            let item = cell.item else {
            return
        }
    }
}
