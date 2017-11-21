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
        let isRight = item.isRight
        
        let operation = BlockOperation { [weak self] in
            let image = RNSImageFactory.imageBusAt(text, selected: isCurrent, width: width, isRight: isRight)
            Utils.mainQueue {
                var xOffset = width/(Float(RNSImageFactory.widthImage) + width)
                xOffset = isRight ? xOffset : -xOffset
                self?.setImage(image, xOffset: xOffset)
            }
        }
        operation.queuePriority = .veryLow
        RNSBusManager.queueMarkers.addOperation(operation)
        self.operation = operation
    }
    
    func setImage(_ image: UIImage, xOffset: Float = 0.0) {
        guard imageSetuped != image else {
             return
        }
        imageSetuped = image
        prepareIcon(image, xOffset: xOffset)
    }
}
