//
//  RNSMoveGenerator.swift
//  RNIS
//
//  Created by Артем Кулагин on 26.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

class RNSMoveStub: NSObject {
    
    /// переменная синглетона
    static let shared = RNSMoveStub()
    
    static func start() {
        shared.start()
    }
    
    static func end() {
        shared.end()
    }
    
    func start() {
        NotificationCenter.addObserverTime(self, selector: #selector(onDateTimer))
    }
    
    func end() {
        NotificationCenter.removeObserver(self)
    }
    
    @objc func onDateTimer() {
        DispatchQueue.global(qos: .background).async {
            let uuds = RNSBusManager.showedUuids
            let items = RNSBusManager.buss(uuds)
            let dicts = items?.flatMap({ $0.stubDictMove})
            Utils.mainQueue {
                RNSMoveBusManager.parse(dicts)
                //print("RNSMoveGenerator",dicts as Any)
            }
        }
    }
}
