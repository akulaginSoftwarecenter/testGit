//
//  BusStop.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation
import RealmSwift

class RNSBusStop: RNSCoordinateModel {
    
    dynamic var title: String = ""
    
    func generate() {
        generate("бул. Конногвардейский")
    }
    
    func generate(_ title: String) {
        self.title = title
        latitude = 59.9344377
        longitude = 30.3010831
    }
    
    static var generateList:[RNSBusStop] {
        var items = [RNSBusStop]()
        let rand = Int.rand(6, limit: generateTitles.count - 6)
        for index in 0...rand {
            let item = RNSBusStop()
            let title = generateTitles.valueAt(index) ?? "Тропарёво"
            item.generate(title)
            items.append(item)
        }
        return items
     }
    
    static var generateTitles: [String] {
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
}
