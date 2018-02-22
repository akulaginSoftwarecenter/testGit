//
//  RNSLeftMenuController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для обработки событий таблицы
extension RNSLeftMenuController {

    /// Метод возврата количества строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count;
    }
    
    /// Метод возврата высоты строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
    /// Метод возврата строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MenuTableViewCell;
        let item = self.item(indexPath)
        cell.updateCell(title: item.title, image: item.image)
        return cell
    }
    
    /// Метод обработки строки по тапу
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        self.item(indexPath).show()
    }
    
    /// Метод возврата элемена в массиве по индексу
    func item(_ indexPath: IndexPath) -> MenuItem {
        return menuItems[indexPath.row]
    }
}
