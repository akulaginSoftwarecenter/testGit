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
    
    /// переменная высоты нижнего констрейнта
    var viewBottomHeightLayoutConstraint: NSLayoutConstraint? {
        get {
            return bottomConstraint
        }
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    
    /// переменная для проверки добавления тапа на вью если нужно
    var isNeedAddTap: Bool = false
    
    /// Представление идикации загрузки
    lazy var loaderView:LoaderView = {
        let view = LoaderView.interactionEnabled
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
    @IBOutlet weak var searchView: RNSSearchView!

    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSearchView()
        prepareHandlers()
        prepareSegmented()
        checkSaved()
        prepareClearColor()
    }
    
    /// метод обработки появления контроллера
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    /// метод обработки исчезновения контроллера
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAllObservers()
    }
}
