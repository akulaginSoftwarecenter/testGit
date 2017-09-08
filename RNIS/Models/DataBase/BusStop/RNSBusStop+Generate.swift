//
//  RNSBusStop+Generate.swift
//  RNIS
//
//  Created by Артем Кулагин on 01.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

extension RNSBusStop {
    /*
    func generate() {
        generate("бул. Конногвардейский")
    }
    */
    static func generate(_ uuid: String, name: String?, lat: Double, lon: Double) -> RNSBusStop {
        let item = RNSBusStop()
        item.generate(uuid, name: name, lat: lat, lon: lon)
        return item
    }
    
    func generate(_ uuid: String, name: String?, lat: Double?, lon: Double?) {
        self.name = name ?? ""
        self.uuid = uuid
        guard let lat = lat,
            let lon = lon else {
                return
        }
        latitude = lat
        longitude = lon
    }

    static var randCount: Int {
        return Int.rand(6, limit: generateTitles.count - 6)
    }
    
    static func randTitle(_ index: Int) -> String {
        return generateTitles.valueAt(index) ?? "Тропарёво"
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
