//
//  BaseNavigationController.swift
//  Spytricks
//
//  Created by Артем Кулагин on 28.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import UIKit

/**
 Базовый класс для контроллера навигации
 */
class BaseNavigationController: UINavigationController,UINavigationControllerDelegate {
    
    /// Метод инициализации класса
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: false)
    }
    
    /// клоужер для получения события выполнения анимации
    var completion: EmptyBlock? = nil
    
    /// Кастомный метод пуш с событием выполения
    func push(_ viewController: UIViewController?, animated: Bool = false,
              completion:EmptyBlock? = nil) {
        guard let viewController = viewController else {
            return
        }
        self.completion = completion
        self.delegate = self
        pushViewController(viewController, animated: animated)
        
        interactivePopGestureRecognizer?.isEnabled = false
    }
    
    /// Кастомный метод поп с событием выполения
    func pop(animated: Bool = false, completion:EmptyBlock? = nil) {
        self.completion = completion
        self.delegate = self
        popViewController(animated: animated)
    }
    
    /// Кастомный метод popToRoot с событием выполения
    func popToRoot(animated: Bool = false, completion:EmptyBlock? = nil) {
        self.completion = completion
        self.delegate = self
        popToRootViewController(animated: animated)
    }
}
