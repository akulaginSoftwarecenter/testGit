//
//  RNSRegistrationNameController+KeyBoard.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSRegistrationNameController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.keyboardWillShow {  [weak self]  (notification) in
            self?.prepareHeightBottom(notification.height)
        }
    }
    
    var blackButton: UIView {
        return coverView.blackButton
    }
    
    func prepareHeightBottom(_ heightKeyboard: CGFloat?) {
        guard let heightKeyboard = heightKeyboard, errorLabel != nil else {
            return
        }
        let fullHeight = view.bounds.height
        let yKeyBoard = fullHeight - heightKeyboard
        let yButton = errorLabel.frame.minY + 2 * errorLabel.frame.height
        if yButton > yKeyBoard {
            let delta = yButton - yKeyBoard + 20
            Utils.delay(0.3, closure: {[weak self] in
                self?.handlerUpdateScroll?(delta)
            })
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.removeObserver(self)
    }
}
