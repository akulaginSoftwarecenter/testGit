//
//  RNSPinBus+Image.swift
//  RNIS
//
//  Created by Артем Кулагин on 21.11.2017.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSPinBus {
    
    func updateImage() {
        guard let item = itemBus else {
            return
        }
        let text = item.route_number
        let isCurrent = item.isCurrent
        let width = self.widthWing
        DispatchQueue.global(qos: .background).async {
            let image = RNSImageFactory.imageBusAt(text, selected: isCurrent, width: width)
            Utils.mainQueue {
                let xOffset = width/(Float(RNSImageFactory.widthImage) + width)
                self.setImage(image, xOffset: xOffset)
            }
        }
    }
    
    func setImage(_ image: UIImage, xOffset: Float = 0.0) {
        guard imageSetuped != image else {
             return
        }
        imageSetuped = image
        prepareIcon(image, xOffset: xOffset)
    }
}
