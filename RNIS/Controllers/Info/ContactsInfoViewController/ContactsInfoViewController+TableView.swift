//
//  ContactsInfoViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 30.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение обработки событий таблицы
extension ContactsInfoViewController: UITableViewDataSource, UITableViewDelegate  {
    
    /// Метод возврата количества строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    /// Метод возврата высоты строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return item(indexPath)?.height ?? 86
    }
    
    /// Метод возврата строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ContactsInfoTableViewCell;
        cell.updateCell(item(indexPath))
        return cell
    }
    
    /// Метод обработки строки по тапу
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        item(indexPath)?.callOrSend()
    }
    
    /// Метод возврата элемена в массиве по индексу
    func item(_ indexPath: IndexPath) -> RNSContactItem? {
        return items?[indexPath.row]
    }
}
