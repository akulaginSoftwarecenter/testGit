//
//  UITableViewCell+Utils.swift
//  Solity-iOS
//
//  Created by Vlad on 17.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

/**
 Расширение для UITableViewCell
 */
extension UITableViewCell: ReusableView, NibLoadableView {
    static var identifier: String {
        return String(describing: self)
    }
}
