//
//  RNSLoaderWay.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Класс Лоадера
 */
class RNSLoaderWay: RNSParentLoaderView {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    func prepareFailure() {
        prepareText("Не удалось загрузить данные")
    }
    
    func prepareCenterLabel() {
        bottomConstraint.isActive = true
    }
    
    func prepareTopLabel() {
        bottomConstraint.isActive = false
    }
    
    func showCenterError(_ view: UIView?, frame: CGRect?, text: String? = nil) {
        if let frame = frame {
            showInView(view, frame: frame)
        } else {
            showInViewBounds(view)
        }
        prepareCenterLabel()
        prepareText(text)
    }
    
    func showCenterLostInet(_ view: UIView?, frame: CGRect? = nil) {
        showCenterError(view, frame: frame, text: errorNetwork)
    }
    
    /// Метод подготовки заголовка
    func prepareTextTop(_ view: UIView?, text: String? = nil, frame: CGRect? = nil) {
        showInViewBounds(view, frame: frame)
        prepareTopLabel()
        prepareText(text)
    }
    
    func showInViewBounds(_ view: UIView?, frame: CGRect? = nil) {
        let defaultFrame = view?.bounds ?? CGRect()
        showInView(view, frame: frame ?? defaultFrame)
    }
    
    override func animationShow() {
        defaultAlpha = 1
        super.animationShow()
    }
}
