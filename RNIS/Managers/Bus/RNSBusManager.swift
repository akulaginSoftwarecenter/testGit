//
//  RNSBusManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 15.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusManager: NSObject {
    static let shared = RNSBusManager()
    
    static var showedItems = [RNSBus]()
    static var showedUuids = [String]()
    
    static var queue: OperationQueue {
        return shared.queue
    }
    
    lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    static var mapView: MapView {
        return RNSMapManager.mapView
    }
}
