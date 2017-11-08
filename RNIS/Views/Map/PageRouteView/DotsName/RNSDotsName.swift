//
//  RNSDotsName.swift
//  RNIS
//
//  Created by Артем Кулагин on 22.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Представление-подпись маршрута
 */
class RNSDotsName: BaseViewWithXIBInit {
    
    @IBOutlet var label: UILabel!
    
    convenience init(_ item: RNSBusRouteTemp?) {
        self.init()
        
        guard let item = item else {
            return
        }
        label.text = item.title
        let width = item.titleWidth
        snp.makeConstraints { (make) in
            make.width.equalTo(width)
            make.height.equalTo(30)
        }
    }
}
