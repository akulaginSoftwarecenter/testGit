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
    var complete: AliasImageBlock?
    
    @discardableResult static func controller(_ showRemove: Bool?, complete: AliasImageBlock?) ->  RNSAlertPhotoController {
        let vc = RNSAlertPhotoController(title: "Откуда взять фотографию?", message: nil, preferredStyle: .actionSheet)
        vc.showRemove = showRemove
        vc.complete = complete
        STRouter.present(vc)
        return vc
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        prepareUI()
    }
    
    func prepareUI() {
        addActionDefault("Сделать фото") {
            print("Сделать фото")
        }
        
        addActionDefault("Выбрать из галерии") {
            print("Выбрать из галерии")
        }
        addAction(UIAlertAction(title: "Отмена", style: .cancel))
    }
    
    func addActionDefault(_ title: String?,  complete: EmptyBlock? = nil) {
        addAction(UIAlertAction(title: title, style: .default) { action in
            complete?()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("RNSAlertPhotoController deinit")
    }

}
