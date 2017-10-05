//
//  RNSBusTemp+Random.swift
//  RNIS
//
//  Created by Артем Кулагин on 05.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusTemp {
    /*
    static func generate(_ point: PGGeoPoint) -> RNSBusTemp {
        let item = RNSBusTemp()
        item.point = point
        item.genNum()
        return item
    }
    
    static var gen: RNSBusTemp {
        let item = RNSBusTemp()
        item.genNum()
        item.generateList()
        item.generateCurrent()
        
        item.driver = "Петров Сергей Иванович"
        item.check_taker = "Константинова Василиана Валерьяновна"
        item.unit_name = "№1151 | E13222 777"
        item.carrier_name = "ООО ТРОЙКА"
        item.unit_phone = "+ 7 (912) 213-32-32"
        
        return item
    }
    
    func genNum() {
        num = Int.rand(1, limit: 200)
    }
    
    func generateList() {
        var items = [RNSBusStopTemp]()
        let rand = randCount
        for index in 0...rand {
            let item = RNSBusStopTemp()
            item.uuid = "\(index)"
            item.name = randTitle(index)
            items.append(item)
        }
        stop_points = items
    }
    
    func generateCurrent() {
        next_stop_point = stop_points?.randomItem()
    }
    
    var randCount: Int {
        return Int.rand(6, limit: generateTitles.count - 6)
    }
    
    func randTitle(_ index: Int) -> String {
        return generateTitles.valueAt(index) ?? "Тропарёво"
    }
    
    var generateTitles: [String] {
        return ["Бульвар Рокоссовского",
                "Черкизовская",
                "Преображенская площадь",
                "Сокольники",
                "Красносельская",
                "Комсомольская",
                "Красные Ворота",
                "Чистые пруды",
                "Лубянка",
                "Охотный Ряд",
                "Библиотека имени Ленина",
                "Кропоткинская",
                "Парк культуры",
                "Фрунзенская",
                "Спортивная",
                "Воробьёвы горы",
                "Университет",
                "Проспект Вернадского",
                "Юго-Западная",
                "Тропарёво",
                "Румянцево",
                "Саларьево",
                "Речной вокзал",
                "Водный стадион",
                "Войковская",
                "Сокол",
                "Аэропорт",
                "Динамо",
                "Белорусская",
                "Маяковская",
                "Тверская",
                "Театральная",
                "Новокузнецкая",
                "Павелецкая",
                "Автозаводская",
                "Технопарк",
                "Коломенская",
                "Каширская",
                "Кантемировская",
                "Царицыно",
                "Орехово",
                "Домодедовская",
                "Красногвардейская",
                "Алма-Атинская",]
    }
 */
}
