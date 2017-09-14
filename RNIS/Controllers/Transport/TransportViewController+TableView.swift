//
//  TransportViewController+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension TransportViewController {
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.segmentControl.selectedSegmentIndex == 0 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.segmentControl.selectedSegmentIndex == 0 {
            if section == 0 {
                return 3
            } else {
                return 2
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont(name: "Cffazmiakhaddpiofffvylaqekz", size: 20)!
        header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = .left
        header.contentView.backgroundColor = UIColor(hex: "EA4C44")
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.segmentControl.selectedSegmentIndex == 0 {
            if section == 0 {
                return "Рядом с вами"
            } else {
                return "Далеко"
            }
        } else {
            return "Рядом с вами"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.segmentControl.selectedSegmentIndex == 0 {
            if indexPath.row == 0 {
                return 34
            }
            return 46
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.segmentControl.selectedSegmentIndex == 0 {
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportTopCell", for: indexPath) as! MyTransportTopCell
                    cell.addressLabel.text = "Ул. Петроградская"
                    return cell;
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportCell", for: indexPath) as! MyTransportCell
                    cell.transportNumber.text = "212"
                    cell.transportTime.text = "5 мин."
                    return cell;
                }
            } else {
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportTopCell", for: indexPath) as! MyTransportTopCell
                    cell.addressLabel.text = "Ул. Ленина"
                    return cell;
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportCell", for: indexPath) as! MyTransportCell
                    cell.transportNumber.text = "362"
                    cell.transportTime.text = "Каждые 8 мин."
                    cell.transportNumber.backgroundColor = UIColor.clear
                    cell.transportNumber.alpha = 0.7
                    return cell;
                }
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTransportTopCell", for: indexPath) as! MyTransportTopCell
            return cell;
        }
    }
 */
}
