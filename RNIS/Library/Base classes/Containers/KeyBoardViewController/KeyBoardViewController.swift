//
//  KeyBoardViewController.swift
//  Spytricks
//
//  Created by Артем Кулагин on 04.04.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit
import SnapKit

/**
 Класс контейнер для обработки появления клавиатуры
 */
class KeyBoardViewController: UIViewController, KeyboardShowable {

    /// переменная высота нижнего констрейнта
    var viewBottomHeightConstraint: Constraint?
    
    /// вью для вставки контейнера
    var innerView: UIView!
    
    /// контейнер для вставки
    var containerVC:UIViewController?
    
    /// Метод инициализации 
    convenience init(_ container: UIViewController?) {
        self.init()
        containerVC = container
    }
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIScrollView()
        prepareContainer()
    }
    
    func setupUIScrollView() {
        let size = view.bounds.size
        let scrollView = UIScrollView()
        scrollView.contentSize = size
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = true
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            viewBottomHeightConstraint = make.bottom.equalTo(0).constraint;
        }
        
        let coverView = UIView()
        scrollView.addSubview(coverView)
        coverView.backgroundColor = .clear
        coverView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(size.width)
            make.height.equalTo(size.height)
        }
        innerView = coverView
    }
    
    func prepareContainer() {
        guard let containerVC = containerVC,
            let containerView = containerVC.view else {
                return
        }
        self.addChildViewController(containerVC)
        innerView.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeAllObservers()
    }
}
