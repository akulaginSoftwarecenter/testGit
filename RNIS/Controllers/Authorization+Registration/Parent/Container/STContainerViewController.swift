//
//  STContainerViewController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

enum TypeTitle: String {
    case registration = "Регистрация"
    case recovery = "Восстановление пароля"
    case change = "Сменить номер"
    case none = ""
}

class STContainerViewController: UIViewController {
    var enterViewController: ContainerProtocol?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        enterViewController = segue.destination as? ContainerProtocol
        prepareEnterViewController()
    }
    
    func prepareEnterViewController(){
        enterViewController?.titleTextTop = typeTitle
        enterViewController?.handlerBlackAction = { [weak self] in
            self?.actionNext()
        }
    }
    
    var typeTitle: TypeTitle {
        return .none
    }
    
    func actionNext() {
        
    }
}
