//
//  RNSSearchViewController+Segmented.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/// Возможные типа объектов поиска: автобусы, остановки, адреса
enum TypeSearch: Int {
    case address = 0, stop, transport
    
    var guery: String {
        switch self {
        case .stop:
            return "stop_points"
        case .address:
            return "address"
        case .transport:
            return "route"
        }
    }
}

/// расширение для работы с представлением переключения вкладок
extension RNSSearchViewController {
    
    /// Тип объектов поиска в активной вкладке
    var typeSegment: TypeSearch {
        let index = segmentedControl.selectedSegmentIndex
        let type = TypeSearch(rawValue: index)
        return type ?? .address
    }
      
    /// Предварительная настройка представления переключения вкладок
    func prepareSegmented() {
        prepareSegment(.address)
        segmentedControl.sendActions(for: .valueChanged)
        segmentedControl.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.cffazm18],
                                            for: .normal)
    }
    
    func prepareSegment(_ type: TypeSearch) {
        segmentedControl.selectedSegmentIndex = type.rawValue
    }
}
