//
//  RNSRegisterTableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSRegisterTableView: UITableView {

    @IBInspectable var registerCellIdentifier: String {
        get { return "" }
        set {
            if !newValue.isEmpty {
                self.registerCell(newValue)
            }
        }
    }
    
    @IBInspectable var registerCellIdentifier1: String {
        get { return "" }
        set {
            if !newValue.isEmpty {
                self.registerCell(newValue)
            }
        }
    }
    
    @IBInspectable var registerCellIdentifier2: String {
        get { return "" }
        set {
            if !newValue.isEmpty {
                self.registerCell(newValue)
            }
        }
    }
    
    @IBInspectable var registerCellIdentifier3: String {
        get { return "" }
        set {
            if !newValue.isEmpty {
                self.registerCell(newValue)
            }
        }
    }
}
