//
//  RNSFavoritesBusView+TableView.swift
//  RNIS
//
//  Created by Артем Кулагин on 14.09.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import Foundation

/**
 Класс создание таблицы вида для избранных маршрутов
 */
extension RNSFavoritesBusView: UITableViewDelegate, UITableViewDataSource {
    
    
    /// Указание номера секций таблицы
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    /// Указание количества строк таблицы по секциям
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items?.count ?? 0
    }
    
    /// Создание ячейки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RNSFavoritesBusCell
        cell.item = item(indexPath)
        /*
        cell.didTapDelete = { [weak self] item in
            guard let section = self?.sections.index(where: { $0.items?.contains(item) ?? false }),
                let row = self?.sections[section].items.index(of: item) else {
                    return
            }
            let indexPath = IndexPath(row: row, section: section)
            if self?.sections[section].items.count == 1 {
                self?.sections.remove(at: section)
                self?.tableView.deleteSections([section], with: .fade)
            } else {
                self?.sections[section].items.remove(at: row)
                self?.tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
 */
        return cell
    }
    
    /// Задание высоты каждой ячейки таблицы
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return item(indexPath)?.height ?? 0
    }
    
    /// Задние высоты оглавления секции таблицы
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    
    /// Функция возврата номера избранной ячейки
    func item(_ indexPath: IndexPath) -> RNSFavoriteStopPoint? {
        return sections[indexPath.section].items?[indexPath.row]
    }
    
    /// Функция задания изображения для ячейки таблицы
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.font = .cffazm20
        label.textColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(view).inset(15)
            make.bottom.equalTo(view)
        }
        label.text = sections[section].title
        return view
    }

    /// Действие при выборе ячейки таблицы
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showStopPoint(item(indexPath))
    }
}
