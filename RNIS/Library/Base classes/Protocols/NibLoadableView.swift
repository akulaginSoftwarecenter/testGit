//
//  NibLoadableView.swift
//  Solity-iOS
//
//  Created by Vlad on 17.11.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView{
    static var nibName: String {
        return String(describing: self)
    }
}
