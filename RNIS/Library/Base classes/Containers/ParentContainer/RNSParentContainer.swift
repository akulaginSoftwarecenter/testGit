//
//  RNSParentContainer.swift
//  RNIS
//
//  Created by Артем Кулагин on 04.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Класс базового контейнера
 */
class RNSParentContainer: UIViewController {

    var containerVC:UIViewController?
    
    /// Метод инициализации 
    convenience init(_ container: UIViewController?) {
        self.init()
        containerVC = container
    }
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareView()
        prepareContainer()
    }
    
    func prepareView() {
        
    }
    
    func prepareContainer() {
        guard let containerVC = containerVC,
            let containerView = containerVC.view else {
                return
        }
        self.addChildViewController(containerVC)
        view.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges()
    }
}
