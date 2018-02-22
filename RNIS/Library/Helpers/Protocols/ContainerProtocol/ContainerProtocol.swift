//
//  ContainerProtocol.swift
//  RNIS
//
//  Created by Артем Кулагин on 02.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
/**
 Протокол для контейнера
 */
protocol ContainerProtocol: class {
    var titleTextTop: TypeTitle? { get set }
    var handlerBlackAction: EmptyBlock? { get set}
}
