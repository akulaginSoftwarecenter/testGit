//
//  RNSAlertPhotoController.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSAlertPhotoController: UIAlertController {
    
    var showRemove: Bool?
    var complete: AliasImagePickerBlock?
    var handlerRemove: EmptyBlock?
    
    @discardableResult static func controller(_ showRemove: Bool?, complete: AliasImagePickerBlock?, handlerRemove: EmptyBlock?) ->  RNSAlertPhotoController {
        let vc = RNSAlertPhotoController(title: "Откуда взять фотографию?", message: nil, preferredStyle: .actionSheet)
        vc.showRemove = showRemove
        vc.complete = complete
        vc.handlerRemove = handlerRemove
        vc.prepareUI()
        return vc
    }

    func prepareUI() {
        addAction("Сделать фото") { [weak self] in
            self?.complete?(.camera)
        }
        
        addAction("Выбрать из галерии") {[weak self] in
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
