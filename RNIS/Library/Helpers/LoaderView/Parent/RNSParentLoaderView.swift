//
//  RNSParentLoaderView.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Класс отображения лоадера
 */
class RNSParentLoaderView: BaseViewWithXIBInit {
    
    /// Метод инициализации
    convenience init(_ delay: TimeInterval = 0) {
        self.init()
        
        self.delay = delay
    }
    /// переменная отображения текста
    @IBOutlet weak var labelText: UILabel!
    
    /// переменная прозрачности по умолчанию
    var defaultAlpha = CGFloat(0.3)
    
    /// переменная задержки перед стартом появления лоадера
    var delay: TimeInterval = 0
    
    /// переменная проверки на существования супер вью
    var isEmptySuperView: Bool{
        return superview == nil
    }
    
    /// Метод старта отображения на вью
    func showInView(_ view: UIView?) {
        addShowInView(view)
        self.autoPinEdgesToSuperviewEdges()
        animationShow()
    }
    
    /// Метод старта отображения на вью ниже belowSubview
    func showInView(_ view: UIView?, belowSubview: UIView? = nil) {
        insertShowInView(view, belowSubview: belowSubview)
        self.autoPinEdgesToSuperviewEdges()
        animationShow()
    }
    
    /// Метод старта отображения на вью с фреймом frame
    func showInView(_ view: UIView?, frame: CGRect) {
        addShowInView(view)
        self.frame = frame
        animationShow()
    }
    
    /// Метод добавления на вью
    func addShowInView(_ view: UIView?) {
        guard isEmptySuperView,
            let view = view else {
                return
        }
        view.addSubview(self)
    }
    
    /// Метод добавления на вью ниже belowSubview
    func insertShowInView(_ view: UIView?, belowSubview: UIView? = nil) {
        guard isEmptySuperView,
            let view = view,
            let belowSubview = belowSubview else {
                return
        }
        view.insertSubview(self, belowSubview: belowSubview)
    }
    
    /// Метод анимации появления
    func animationShow() {
        self.alpha = 0
        UIView.animate(withDuration: 0.5, delay: delay, options: .curveLinear, animations: {[weak self] in
            self?.alpha = self?.defaultAlpha ?? 0.3
            }, completion:nil)
    }
    
    /// Метод анимации удаления
    func remove(_ complete: EmptyBlock? = nil) {
        UIView.animate(withDuration: 0.2, animations: {[weak self] in
            self?.alpha = 0
            }, completion: { [weak self] (_) in
                self?.removeFromSuperview()
                complete?()
        })
    }
    
    /// Метод подготовки текстов
    func prepareText(_ text: String?) {
        labelText.text = text
    }
}
