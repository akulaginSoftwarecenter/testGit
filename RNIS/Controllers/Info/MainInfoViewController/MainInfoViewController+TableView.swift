//
//  MainInfoViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Расширение для обработки событий таблицы
extension MainInfoViewController: UITableViewDelegate, UITableViewDataSource  {

    /// Метод возврата количества строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count;
    }
    
    /// Метод возврата высоты строк
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension >= 54 ? UITableViewAutomaticDimension : 54
    }
    
    /// Метод возврата строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MainInfoTableViewCell;
        cell.updateCell(title:menuTitles[indexPath.row]);
        return cell
    }
    
    /// Метод обработки строки по тапу
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            showDocsInfo(.contacts)
            break;
        case 1:
            showDocsInfo(.forgotten)
            break;
        case 2:
            QRScannerInfoViewController.initialPushAnimatedRed()
            break;
        case 3:
            showPetition(.complaint)
            break;
        case 4:
            showPetition(.feedback)
            break;
        case 7:
            AboutAppInfoViewController.initialPushAnimatedRed()
            break;
        case 5:
            showDocsInfo(.userGuide)
            break;
        case 6:
            showDocsInfo(.termOfUse)
            break;
        default:
            break;
        }
    }
}
