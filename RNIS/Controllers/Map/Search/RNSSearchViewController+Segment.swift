//
//  RNSSearchViewController+Segmented.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

enum typeSearch:Int {
    case address = 0, stop, transport
}

extension RNSSearchViewController {
    
    var typeSegment: typeSearch {
        let index = segmentedControl.selectedSegmentIndex
        let type = typeSearch(rawValue: index)
        return type ?? .address
    }
      
    func prepareSegmented() {
        decorControl.setTitleTextAttributes([NSFontAttributeName: UIFont.cffazm18],
                                                for: .normal)
    }
}
