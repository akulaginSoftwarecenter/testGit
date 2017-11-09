//
//  RNSFavoritesBusView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс создание вида для избранных маршрутов
 */
struct TableSection {
    let title: String?
    var items: [RNSFavoriteStopPoint]?
}

class RNSFavoritesBusView: BaseViewWithXIBInit {
    
    /// Экземпляр класса вида загрузки
    lazy var loaderView = LoaderView()
    lazy var loaderWay = RNSLoaderWay()
    /// Создание секций таблицы
    var sections = [TableSection]()
    
    /// Создание "слабого" экземпляра представления таблицы
    @IBOutlet weak var tableView: UITableView!
    
    /// Инициализация класса
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /// Создание отступов таблицы
        tableView.contentInset = UIEdgeInsetsMake(27, 0, 0, 0);
        prepareHandlers()
    }
    
    /// Подготовка блока обноления данных таблицы
    func prepareHandlers() {
        RNSMenuManager.handlerUpdateFavoriteBuss = {[weak self] in
            self?.loadData()
        }
    }
}
