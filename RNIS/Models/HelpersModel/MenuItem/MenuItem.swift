//
//  MenuItem.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

struct MenuItem {
    
    var vc: UIViewController?
    var title: String?
    var image: UIImage?
    
    init(_ title: String?, _ vc: UIViewController?, _ image: UIImage?) {
        self.title = title
        self.vc = vc
        self.image = image
    }
}
