//
//  RNSLoaderWay.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSLoaderWay: RNSParentLoaderView {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    func prepareFailure() {
        prepareText("Не удалось загрузить данные")
    }
    
    func prepareCenterLabel() {
        bottomConstraint.isActive = true
    }
    
    func showCenterError(_ view: UIView?, frame: CGRect?, text: String? = nil) {
        if let frame = frame {
            showInView(view, frame: frame)
        } else {
            showInView(view, frame: view?.bounds ?? CGRect())
        }
        prepareCenterLabel()
        prepareText(text)
    }
    
    func showCenterLostInet(_ view: UIView?, frame: CGRect? = nil) {
        showCenterError(view, frame: frame, text: errorNetwork)
    }
    
    func prepareText(_ text: String?) {
        labelText.text = text
    }
    
    override func animationShow() {
        defaultAlpha = 1
        super.animationShow()
    }
}
