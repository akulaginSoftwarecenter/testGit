//
//  RNSFlagButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Кнопка добавления в избранное
 */
class RNSFlagButton: BaseViewWithXIBInit {
    
    /// Обработчик обновления
    var handlerUpdate: EmptyBlock?
    
    /// Индикатор загрузки
    lazy var loaderView = LoaderView()
    
    /// Кнопка
    @IBOutlet weak var button: UIButton!
    /// Представление фонового рисунка
    @IBOutlet weak var imageView: UIImageView!
    
    /// Состояние добавления в избранное
    var isFavorite: Bool = false {
        didSet {
            imageView.image = isFavorite ? #imageLiteral(resourceName: "flagFill") : #imageLiteral(resourceName: "flagClear")
            removeLoader()
        }
    }
    
    /// Событие нажатия
    @IBAction func actionButton(_ sender: Any) {
        handlerUpdate?()
        showLoader()
    }
    
    /// метод обработки загрузки вью
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareConstraint()
    }
    
    /// Показать индикатор загрузки
    func showLoader() {
        isUserInteractionEnabled = false
        loaderView.showInView(imageView)
    }
    
    /// Убрать индикатор загрузки
    func removeLoader() {
        isUserInteractionEnabled = true
        loaderView.remove()
    }
    
    /// Настройка ограничений
    func prepareConstraint() {
        guard let view = superview else {
            return
        }
        snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(97)
            make.top.right.equalTo(view)
        }
    }
}
