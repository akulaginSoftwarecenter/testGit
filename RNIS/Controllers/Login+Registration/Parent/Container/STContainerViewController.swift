//
//  STContainerViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit


/// Перечисление вариантов текста для заголовка
///
/// - registration: Заголовок для контроллера регистрации
/// - recovery: Заголовок для контроллера восстановления пароля
/// - change: Заголовок для контроллера смены номера телефона
/// - none: Без заголовка
enum TypeTitle: String {
    case registration = "Регистрация"
    case recovery = "Восстановление пароля"
    case change = "Сменить номер"
    case changeEmail = "Сменить email"
    case none = ""
}

/**
 Базовый контроллер, который служит контейнером для другого контроллера.
 Присоединение контроллера происходит в Storyboard.
 */
class STContainerViewController: UIViewController {
    
    /// внутренний контроллер
    var enterViewController: ContainerProtocol?
    /// Функция подготовки контейнера
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        enterViewController = segue.destination as? ContainerProtocol
        prepareEnterViewController()
        segue.destination.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /// Подготовление внутреннего контроллера к присоединению
    func prepareEnterViewController() {
        enterViewController?.titleTextTop = typeTitle
        enterViewController?.handlerBlackAction = { [weak self] in
            self?.actionNext()
        }
    }
    
    /// Функция определяет тип заголовка внутреннего контроллера. По-умолчанию заголовка нет.
    var typeTitle: TypeTitle {
        return .none
    }
    
    /// Абстрактное событие "Далее", которое наследники могут использовать для перехода к следующему шагу. По-умолчанию это событие зажигается анонимной функцией handlerBlackAction внутреннего контроллера.
    func actionNext() {
        
    }
}
