//
//  RNSBus.swift
//  RNIS
//
//  Created by Артем Кулагин on 10.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit
import RealmSwift
/// Перечисление лево право иконки
enum TypeWing {
    case left,right
    /// переменная это право
    var isRight: Bool {
        return self == .right
    }
}
/**
 Класс автобуса в базе
 */
class RNSBus: RNSCoordinateModel {
    /// переменная количества минут
    @objc dynamic var minute: Int = 0
    /// переменная номера маршрута автобуса
    @objc dynamic var route_number: String = ""
    /// переменная отображения следующего представления
    @objc dynamic var showNext: Bool = false
    /// переменная остановок автобуса
    let busStops = List<RNSBusStop>()
    @objc dynamic var currentBusStops: RNSBusStop?
    /// переменная водитель
    @objc dynamic var driver: String? = nil
    /// переменная кондуктор
    @objc dynamic var conductor: String? = nil
    /// переменная депо
    @objc dynamic var depo: String? = nil
    /// переменная гаража
    @objc dynamic var carrier: String? = nil
    /// переменная телефона
    @objc dynamic var phone: String? = nil
    /// переменная хранения направления иконки
    var typeWing = TypeWing.left
    /// переменная хранения направления иконки если право
    var isRight: Bool {
        return typeWing.isRight
    }
    /// Функция генерирования тестового автобуса
    func generate() {
        
        minute = Int.rand(1, limit: 200)
        route_number = String(Int.rand(1, limit: 30))
        showNext = Bool.random
        
        latitude = redPlaceLocation.coordinate.latitude
        longitude = redPlaceLocation.coordinate.longitude
        /*
        let list = RNSBusStop.generateList
        busStops.append(objectsIn: list)
        currentBusStops = list.randomItem()
        */
        driver = "Петров Сергей Иванович"
        conductor = "Константинова Василиана Валерьяновна"
        depo = "№1151 | E13222 777"
        carrier = "ООО ТРОЙКА"
        depo = "№1151 | E13222 777"
        phone = "+ 7 (912) 213-32-32"
    }
    /// переменная хранения ширины текста
    lazy var widthWing: CGFloat = {
        return route_number.width(RNSImageFactory.font) + RNSImageFactory.betweenText + RNSImageFactory.edgeText
    }()
}
