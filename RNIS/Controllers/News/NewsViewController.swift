//
//  NewsViewController.swift
//  menuInfo
//
//  Created by Ilya Inyushin on 30.08.17.
//  Copyright © 2017 Ilya Inyushin. All rights reserved.
//

import UIKit

/**
 Контроллер новостей
 */
class NewsViewController: UIViewController {
    
    /// переменная таблицы
    @IBOutlet weak var tableView: UITableView!
    
    /// массив моделей новостей
    var items: [RNSNewsTemp]?
    
    /// лоадер
    lazy var loaderView: LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        return view
    }()
    /// Представление индикации загрузки
    lazy var loaderWay = RNSLoaderWay()
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        prepareHandlers()
    }
    
    /// Подписка на клоужеры
    func prepareHandlers() {
        RNSMenuManager.handlerNewsUpdate = { [weak self] in
            self?.loadItems()
        }
    }
    
    /// Загрузка данных
    func loadItems() {
        loaderView.showInView(view)
        RNSPostNews(complete: { [weak self] items in
            self?.clearError()
            self?.prepareItems(items)
        }) { [weak self] text in
            self?.prepareError(text)
        }
    }
    
    /// Метод отображения ошибок
    func prepareError(_ text: String?) {
        loaderWay.showCenterError(self.view, frame: tableView.frame, text: text)
        prepareItems(nil)
    }
    
    /// Метод очистки ошибок
    func clearError() {
        loaderWay.remove()
    }
    
    /// Метод подготовки массива данных
    func prepareItems(_ items: [RNSNewsTemp]?) {
        self.items = items
        tableView.reloadData()
        removeLoader()
    }
    
    /// Удаление лоадера
    func removeLoader() {
        loaderView.remove()
    }
}
