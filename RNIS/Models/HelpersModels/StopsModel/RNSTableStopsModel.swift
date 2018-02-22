//
//  RNSTableStopsModel.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift

/**
 Класс таблицы остановки
 */
class RNSTableStopsModel {
    
    var item: RNSBus?
    
    /// Метод инициализации 
    init(_ item: RNSBus?) {
        self.item  = item
        prepareItems()
    }
    
    /// Метод подготовки массива данных
    func prepareItems() {
        
    }
}
