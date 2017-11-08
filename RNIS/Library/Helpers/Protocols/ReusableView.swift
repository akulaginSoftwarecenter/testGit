//
//  ReusableView.swift
//  Solity-iOS
//
//  Created by Vlad on 17.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
