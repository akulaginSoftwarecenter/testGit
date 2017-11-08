//
//  RNSParoleContainerController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер, который является контейнером для RNSParoleViewController
 */
class RNSParoleContainerController: STContainerViewController {

    /// Данные пользователя
    var item: RNSUserPayload?
    
    /// Внутренний контроллер
    var containerViewController: RNSParoleViewController? {
        return (enterViewController as? RNSParoleViewController)
    }
    
    override func prepareEnterViewController(){
        super.prepareEnterViewController()
        
        containerViewController?.placeholderPassworOne = placeholderPassworOne
        containerViewController?.titleBlackButton = titleBlackButton
    }
    
    /// Текст пароля из поля внутреннего контроллера
    var passwordOne: String? {
        return containerViewController?.passwordOneField.text
    }
    
    /// Текст из поля подтверждения пароля внутреннего контроллера
    var passwordTwo: String? {
        return containerViewController?.passwordTwoField.text
    }
    
    /// Заполнитель для поля пароля
    var placeholderPassworOne: String?  {
        return ""
    }
    
    /// Заголовок для кнопки перехода к следующему шагу
    var titleBlackButton: String? {
        return ""
    }
    
    override func actionNext() {
        item?.password = passwordOne
        actionComplete(item)
    }
    
    /// Событие завершения действий во внутреннем контроллере
    ///
    /// - Parameter item: Данные пользователя
    func actionComplete(_ item: RNSUserPayload?) {
        
    }
  
    override class var storyboardName: String {
        return kParoleVC
    }
}
