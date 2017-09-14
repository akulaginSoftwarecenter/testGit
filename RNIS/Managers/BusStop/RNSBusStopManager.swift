//
//  RNSBusStopManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSBusStopManager: NSObject {
    
    static let shared = RNSBusStopManager()
    
    static var showedStops = [RNSBusStop]()
    static var showedStopsUuids = [String]()
    
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
