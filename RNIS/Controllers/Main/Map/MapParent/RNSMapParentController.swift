//
//  RNSMapParentController.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер для демонстрации карты
 */
class RNSMapParentController: UIViewController {

    /// Получение экземпляра карты
    var mapView: MapView {
        return RNSMapManager.mapView
    }
    /// Кнопка увеличения зума
    @IBOutlet weak var plusButtonZoom: UIButton!
    /// Кнопка уменьшения зума
    @IBOutlet weak var minusButtonZoom: UIButton!
    /// Массив ограничителей для демонстрации кнопок на карте
    @IBOutlet var showingButtonsConstraints: [NSLayoutConstraint]!
    /// Массив ограничителей для того, чтобы спрятать кнопки на карте
    @IBOutlet var hidingButtonsConstraints: [NSLayoutConstraint]!
    /// Контейнер для левого ряда кнопок
    @IBOutlet weak var leftStackView: UIStackView!
    /// Контейнер для правого ряда кнопок
    @IBOutlet weak var rightStackView: UIStackView!
    /// Кнопка меню
    @IBOutlet weak var menuButton: UIButton!
    /// Кнопка поиска
    @IBOutlet weak var searchButton: UIButton!
    //
    /// Блок, который вызывается событием обновления карты
    var handlerOnMapEvent: EmptyBlock?
    /// Блок, который вызывается событием нажатия на карту
    var handlerOnMapTouchEvent: AliasPointBlock?
    /// Блок, который вызывается событием длительного нажатия на карту
    var handlerOnMapLongTouchEvent: AliasPointBlock?
    /// Блок, который вызывается событием добавления оверлея на карту
    var handlerOnOverlay: ((PGOverlay,PGOverlayItem) -> ())?
    
    var bottomTargetConstant: CGFloat?
    @IBOutlet weak var bottomTarget: NSLayoutConstraint!
    
    /// Кнопка включения/отключения демонстрации трафика на карте
    @IBOutlet weak var lightButton: RNSLightButton!
    
    /// Представление индикации загрузки
    lazy var loaderView:LoaderView = {
        let view = LoaderView()
        view.isUserInteractionEnabled = false
        view.defaultAlpha = 0.2
        return view
    }()
    
    private var animator: MapButtonsAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTargetIcon()
        updateZoom()
        prepareAnimator()
        _ = RNSMapManager.pinMyLocation
    }
    
    
    /// Настройка аниматора
    func prepareAnimator() {
        animator = MapButtonsAnimator(superview: view, duration: 0.3, usingSpringAnimation: false)
        animator.extraAnimationsWithVisibilityStateHidden = { [weak self] in
            self?.menuButton.alpha = $0 ? 0 : 1
            self?.searchButton.alpha = $0 ? 0 : 1
            self?.leftStackView.alpha = $0 ? 0 : 1
            self?.rightStackView.alpha = $0 ? 0 : 1
        }
    }
    
    /// Обновление надписи с зумом
    func updateZoom() {
        RNSBusStopManager.updateZoom()
    }
    
    func prepareTargetIcon() {
        guard let constant = bottomTargetConstant else {
            return
        }
        bottomTarget.constant = constant
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        plusButtonZoom.isHidden = UserDefaults.hideZoomButtonInMap
        minusButtonZoom.isHidden = UserDefaults.hideZoomButtonInMap
        prepareMapView()
        navigationController?.navigationBar.isHidden = true
        animator.setMapButtons(hidden: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        animator.setupOnce(showingButtonsConstraints, hidingButtonsConstraints, initialVisibilityStateHidden: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        animator.setMapButtons(hidden: false, animated: true)
        prepareHandlers()
    }
    
    func prepareHandlers() {
        RNSMapManager.handlerUpdateLoader = { [weak self] in
            self?.updateLoader()
        }
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
    
    deinit {
       // print("RNSMapParentController deinit")
    }
}
