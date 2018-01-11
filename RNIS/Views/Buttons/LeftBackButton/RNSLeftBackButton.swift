//
//  RNSLeftBackButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 03.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import SnapKit

/**
 Кнопка возврата на предыдущий контроллер
 */
class RNSLeftBackButton: UIButton {
    
    @IBInspectable var leftContentOffset: CGFloat = 0
    @IBInspectable var actionDefault: Bool = true

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let image = imageShevron.withRenderingMode(.alwaysOriginal)
        setImage(image, for: .normal)

        prepareConstraint()
        prepareDefaultAction()
    }
    
    var imageShevron: UIImage {
        return #imageLiteral(resourceName: "chevronLeft")
    }
    
    /// Настройка обработчика по-умолчанию
    func prepareDefaultAction() {
        guard actionDefault else {
            return
        }
        touchUpInside { [weak self] in
            self?.actionTouch()
        }
    }
    
    /// Обработчик нажатия
    func actionTouch() {
        STRouter.pop()
    }
    
    /// Настройка ограничителей
    func prepareConstraint() {
        guard let view = superview else {
            return
        }
        snp.makeConstraints { (make) in
            make.height.equalTo(97)
            make.width.equalTo(70)
            make.left.equalTo(view).offset(-leftContentOffset)
            make.top.equalTo(view)
        }
    }
}
