//
//  RNSSearchViewController+Segmented.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

enum TypeSearch: Int {
    case transport = 0, stop, address
}

extension RNSSearchViewController {
    
    var typeSegment: TypeSearch {
        let index = segmentedControl.selectedSegmentIndex
        let type = TypeSearch(rawValue: index)
        return type ?? .address
    }
      
    func prepareSegmented() {
        prepareSegment(.transport)
        segmentedControl.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.cffazm18],
                                            for: .normal)
    }
    
    func prepareSegment(_ type: TypeSearch) {
        segmentedControl.selectedSegmentIndex = type.rawValue
    }
}
