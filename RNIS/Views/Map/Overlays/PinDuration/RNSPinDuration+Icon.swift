//
//  RNSPinDuration+Icon.swift
//  RNIS
//
//  Created by Артем Кулагин on 09.11.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Расширение для работы с иконкой
 */
extension RNSPinDuration {
    
    var isHide: Bool {
        return item?.isHide ?? false
    }
    
    var imageIcon: UIImage? {
        return RNSNoteRoute(durationMinute: item?.durationMinute, distance: item?.distance, type: .up).asImage
    }
    
    /// Обновление иконки
    func updateIcon() {
       setImage(isHide ? nil : imageIcon)
    }
    
    func setImage(_ image: UIImage?) {
        setBitmap(image, xOffset: 0, yOffset: 1.0, isPlain: false, sizeInMeters: 50)
    }
}
