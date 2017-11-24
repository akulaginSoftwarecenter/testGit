//
//  ViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import PureLayout

/**
 Расширенный контроллер для демонстрации карты
 */

class RNSMapViewController: UIViewController {
    
    /// Массив ограничителей для демонстрации кнопок на карте
    @IBOutlet var showingButtonsConstraints: [NSLayoutConstraint]!
    /// Массив ограничителей для того, чтобы спрятать кнопки на карте
    @IBOutlet var hidingButtonsConstraints: [NSLayoutConstraint]!
    //
    /// Внутренний контроллер
    var containerController: RNSMapParentController?
    var presentViewController: UIViewController?
    let kShouldShowWelcome = "kShouldShowWelcome"
    var shouldShowWelcome: Bool {
        return UserDefaults.standard.object(forKey: kShouldShowWelcome) == nil
    }
    var welcomeSimulationView: UIView?

    /// Кнопка демонстрации маршрута
    @IBOutlet weak var routeBtn: UIButton!
//    @IBOutlet weak var menuBtn: UIButton!
    /**
    route in RNSPostRouting com.rnis.geo.action.service.routing
     */
    /// Модель отображения маршрута
    var route: PGPolyline?
    private var animator: MapButtonsAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RNSMapManager.startLocation()
        prepareAnimator()
        simulateWelcomePresentationIfNeed()
    }
    
    func loadWelcomeIfNeed() {
        if shouldShowWelcome {
            let containerVC = RNSWelcomeViewContoller.initialController
            STRouter.present(containerVC, animated: false) {
                if let welcomeView = self.welcomeSimulationView {
                    welcomeView.removeFromSuperview()
                }
            }
            setShouldShowWelcome(false)
        }
    }
    
    func setShouldShowWelcome(_ shouldShow: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(shouldShow, forKey: kShouldShowWelcome)
        defaults.synchronize()
    }
    
    func simulateWelcomePresentationIfNeed() {
        if shouldShowWelcome {
            let containerVC = RNSWelcomeViewContoller.initialController
            welcomeSimulationView = containerVC?.view
            view.addSubview(welcomeSimulationView!)
        }
    }
    
    /// Настройка аниматора кнопок
    func prepareAnimator() {
        animator = MapButtonsAnimator(superview: view, duration: 0.3, usingSpringAnimation: false)
        animator.extraAnimationsWithVisibilityStateHidden = { [weak self] in
            self?.prepareAlpha($0 ? 0 : 1)
        }
    }
    
    /// Настройка прозрачности кнопок
    ///
    /// - Parameter alpha: степень прозрачности
    func prepareAlpha(_ alpha: CGFloat) {
        routeBtn.alpha = alpha
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RNSPageRouteManager.removeAllRoute()
        RNSPageRouteManager.items = nil
        prepareHandlers()
        animator.setMapButtons(hidden: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animator.setupOnce(showingButtonsConstraints, hidingButtonsConstraints, initialVisibilityStateHidden: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animator.setMapButtons(hidden: false, animated: true)
        loadWelcomeIfNeed()
    }
    
    override class var storyboardName: String {
        return "RNSMapParentController"
    }
}

