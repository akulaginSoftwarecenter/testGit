//
//  EventDispatcher.swift
//  Solity-iOS
//
//  Created by Vlad on 17.12.16.
//  Copyright © 2016 el-machine. All rights reserved.
//

import Foundation
import UIKit

protocol EventDispatcher: class
{
    func addEventListener(_ handler: EventHandler)
    func dispatchEvent(_ event: Event)
}

extension EventDispatcher
{
    func addEventListener(_ handler: EventHandler)
    {
        let eventListeners = EventListener()
        eventListeners.listener = handler
        
        objc_setAssociatedObject(self,
                                 &EventDispatcherKey.eventDispatcher,
                                 eventListeners,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    func dispatchEvent(_ event: Event)
    {
        guard let eventListener = objc_getAssociatedObject(self, &EventDispatcherKey.eventDispatcher) as? EventListener,
        let listener = eventListener.listener else
        {
            return
        }
        
        listener.function(event)
    }
}

struct EventDispatcherKey
{
    static var eventDispatcher = "eventDispatcher"
}

struct EventHandler
{
    let function: (Event) -> Void
}

struct Event
{
    let target: EventDispatcher
}

/**
 Класс появления листенера
 */
class EventListener
{
    var listener: EventHandler?
}
