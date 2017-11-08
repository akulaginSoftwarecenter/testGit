//
//  RNSCoverViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
Базовый контроллер для контроллеров связанных с входом и регистрацией
 */
class RNSCoverViewController: UIViewController {
    
    /// Фоновое представление для входа и регистрации
    @IBOutlet var coverView: RNSLoginView!
    
    /// Обработчик нажатия кнопки перехода к следующему шагу
    var handlerBlackAction: EmptyBlock?
    
    /// Текст, который будет отображаться в заголовке контроллера
    var titleTextTop: TypeTitle?
    
    /// Представление с текстом ошибки
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCoverView()
    }
    
/// Метод, который производит действия, связанные с подготовлением coverView к демонстрации.
/// Предназначен для выполнения во viewDidLoad().
    func prepareCoverView() {
        prepareTitleTextTop()
        coverView.handlerBlackAction = { [weak self] in
            self?.loginPressed()
        }
    }
    
/// Метод, который производит действия, связанные с подготовлением заголовка контроллера к демонстрации
    func prepareTitleTextTop() {
        guard let titleTextTop = titleTextTop else {
            return
        }
        coverView.titleTextTop = titleTextTop.rawValue
    }

/// Событие нажатия на кнопку входа.
    func loginPressed() {
        
    }
}
