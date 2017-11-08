//
//  RNSAlertPhotoController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Контроллер-алерт для выбора действия из списка, связанного с установкой фотографии
 */
class RNSAlertPhotoController: UIAlertController {
    
    /// Показывать ли кнопку "Удалить"
    var showRemove: Bool?
    /// Блок, который выполнится после выбора любого действия, кроме удаления
    var complete: AliasImagePickerBlock?
    /// Блок, который выполнится в случае если выбрано действие "Удалить"
    var handlerRemove: EmptyBlock?
    
    /// Создание контроллера
    ///
    /// - Parameters:
    ///   - showRemove: показывать ли кнопку удаления
    ///   - complete: блок окончания выбора фото
    ///   - handlerRemove: блок удалени фото
    @discardableResult static func controller(_ showRemove: Bool?, complete: AliasImagePickerBlock?, handlerRemove: EmptyBlock?) ->  RNSAlertPhotoController {
        let vc = RNSAlertPhotoController(title: "Установка фото", message: nil, preferredStyle: .actionSheet)
        vc.showRemove = showRemove
        vc.complete = complete
        vc.handlerRemove = handlerRemove
        vc.prepareUI()
        return vc
    }

    /// Настройка представлений
    func prepareUI() {
        addAction("Сделать фото") { [weak self] in
            self?.complete?(.camera)
        }
        
        addAction("Выбрать из галереи") {[weak self] in
            self?.complete?(.photoLibrary)
        }
        
        addCancel()
        addAction("Отмена", style: .cancel)
    }
    
    func addAction(_ title: String?, style: UIAlertActionStyle = .default, complete: EmptyBlock? = nil) {
        addAction(UIAlertAction(title: title, style: style) {action in
            complete?()
        })
    }
    
    func addCancel() {
        guard showRemove ?? false else {
            return
        }
        addAction("Удалить", style: .destructive, complete: handlerRemove)
    }
}
