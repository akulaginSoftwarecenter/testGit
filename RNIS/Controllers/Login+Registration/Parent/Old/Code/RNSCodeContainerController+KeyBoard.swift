//
//  RNSCodeContainerController+KeyBoard.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с клавиатурой
 */
extension RNSCodeContainerController {
    
    /// метод обработки появления контроллера
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.keyboardWillShow {  [weak self]  (notification) in
            self?.prepareHeightBottom(notification.height)
        }
    }
    
    /// Возвращает кнопку повторной отправки кода подтверждения внутреннего контроллера и nil, если ее там нет
    var repeatButton: UIButton? {
        return containerViewController?.repeatButton
    }
    
    /// Событие появления клавиатуры в контроллере.
    /// По-умолчанию запускается обработчик handlerUpdateScroll(:), если он есть.
    /// Но выше описанное выполнится только в случае, если клавиатура закрывает кнопку повтора отправки кода подтверждения
    ///
    /// - Parameter heightKeyboard: Высота клавиатуры
    func prepareHeightBottom(_ heightKeyboard: CGFloat?) {
        guard let heightKeyboard = heightKeyboard, repeatButton != nil else {
            return
        }
        let fullHeight = view.bounds.height
        let yKeyBoard = fullHeight - heightKeyboard
        let yButton = repeatButton?.frame.maxY ?? 0
        if yButton > yKeyBoard {
            let delta = yButton - yKeyBoard + 20
            Utils.delay(0.1, closure: {[weak self] in
                self?.handlerUpdateScroll?(delta)
            })
        }
    }
    
    /// метод обработки исчезновения контроллера
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.removeObserver(self)
    }
}
