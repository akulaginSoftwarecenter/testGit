//
//  NotificationsViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 27.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение обработки событий таблицы
extension NotificationsViewController: UITableViewDataSource, UITableViewDelegate  {
    
    /// Метод возврата количества строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    /// Метод возврата высоты строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    /// Метод возврата строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell;
         cell.updateCell(model: items?[indexPath.row])
        return cell
    }
    
    /// Метод обработки строки по тапу
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let controller = NotificationsSettingsViewController.initialControllerType()
        controller?.item = items?[indexPath.row]
        controller?.pushAnimatedRed()
    }
}
