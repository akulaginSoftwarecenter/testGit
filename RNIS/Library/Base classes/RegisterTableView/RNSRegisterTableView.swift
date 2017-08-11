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
}
