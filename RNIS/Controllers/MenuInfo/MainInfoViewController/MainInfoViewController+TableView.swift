//
//  MainInfoViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension MainInfoViewController: UITableViewDelegate, UITableViewDataSource  {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension >= 54 ? UITableViewAutomaticDimension : 54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MainInfoTableViewCell;
        cell.updateCell(title:menuTitles[indexPath.row]);
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let row = indexPath.row
        switch indexPath.row {
        case 0,1:
            self.performSegue(withIdentifier: main_to_contacts, sender: row)
            break;
        case 2:
            self.performSegue(withIdentifier: "main_to_qrScanner", sender: self)
            break;
        case 3:
            ReportInfoViewController.initialController.pushAnimatedRedScroll()
            break;
        case 4:
            SupportInfoViewController.initialController.pushAnimatedRedScroll()
            break;
        case 7:
            self.performSegue(withIdentifier: "main_to_aboutApp", sender: self)
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
