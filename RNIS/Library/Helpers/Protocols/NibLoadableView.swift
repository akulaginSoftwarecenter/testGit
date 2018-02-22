//
//  NibLoadableView.swift
//  Solity-iOS
//
//  Created by Vlad on 17.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

/**
 Протокол для NibLoadableView
 */
protocol NibLoadableView: class {}

/**
 Расширение NibLoadableView
 */
extension NibLoadableView where Self: UIView{
    static var nibName: String {
        return String(describing: self)
    }
}
