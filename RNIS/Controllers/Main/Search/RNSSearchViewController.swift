//
//  RNSSearchViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 11.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер поиска на карте
 */
class RNSSearchViewController: UIViewController, KeyboardShowable {
    
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomConstraint
        }
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var isNeedAddTap: Bool = false
    
    /// Представление идикации загрузки
    lazy var loaderView:LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        view.labelText.text = "Идет запрос..."
        return view
    }()
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    /// Поле ввода поискового запроса
    @IBOutlet weak var textField: RNSTextField!
    /// Представление для переключения вкладок
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    /// Таблица результатов поиска
    @IBOutlet weak var tableView: UITableView!
    
    /// Массив моделей ячеек таблицы результатов поска
    var items: [RNSTextItem]?
    /// Поисковый запрос на сервер
    var request: AlamofireAPI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSegmented()
        checkSaved()
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        prepareClearColor()
    }
    
    /// Обновление представлений используя последний поисковый запрос если он имеется
    func checkSaved() {
        prepareSegment(RNSSearchManager.type ?? .transport)
        guard let text = RNSSearchManager.text, !text.isEmpty else {
            return
        }
        textField.text = text
        updateSearch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAllObservers()
    }
    
    override class var storyboardName: String {
        return "RNSSearchViewController"
    }
    
    deinit {
        print("RNSSearchViewController deinit")
    }
}
