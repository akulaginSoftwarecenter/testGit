//
//  RNSLightButton.swift
//  RNIS
//
//  Created by Артем Кулагин on 20.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import UIKit

/**
 Кнопка вкл/откл трафика
 */
class RNSLightButton: BaseViewWithXIBInit {
    
    /// Блок нажатия
    var handlerAction: EmptyBlock?
    /// Индикатор загрузки
    lazy var loaderView:LoaderView = LoaderView()
    
    /// кнопка
    @IBOutlet weak var button: UIButton!
    /// Надпись заголовка
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateStateLightButton()
        button.touchUpInside(handler: changeTraffic)
    }
    
    /// Загрузка данных о трафике. Загружает данные о трафике области на карте, которую описывает прямоугольник, задаваемый двумя точками.
    ///
    /// - Parameters:
    ///   - minCoord: крайняя верхняя левая точка прямоугольника на карте
    ///   - maxCoord: крайняя нижняя правая точка прямоугольника на карте
    ///   - zoom: уровень зума
    func loadTraffic(minCoord: PGGeoPoint?, maxCoord: PGGeoPoint?, zoom: Int32?) {
        //loaderView.showInView(self)
        RNSGetTraffic(minCoord: minCoord, maxCoord: maxCoord, zoom: zoom) {[weak self] (reply, error, handleError) in
            //self?.loaderView.remove()
            self?.prepareAverageTraffic(reply as? Int)
        }
    }
    
    /// Настройка представлений в зависимости от степени загрузки трафика
    ///
    /// - Parameter average: значение загрузки трафика
    func prepareAverageTraffic(_ average: Int?) {
        prepareImage(average)
        prepareLabel(average)
    }
    
    /// Настройка надписей
    ///
    /// - Parameter average: значение згарузки трафика
    func prepareLabel(_ average: Int?) {
        guard let average = average else {
            return
        }
        if (average == 0) {
            hiddenLabel()
        }else {
            label.text = String(average);
            label.isHidden = false;
        }
    }
    
    /// Настройка фонового рисунка
    ///
    /// - Parameter average: значение загруженности трафика
    func prepareImage(_ average: Int?) {
        guard let average = average else {
            return
        }
        var image:UIImage
        if (average == 0) {
            image = #imageLiteral(resourceName: "svetofor_selected")
        } else if (average < 4) {
            image = #imageLiteral(resourceName: "ic_svetofor_green")
        }else if (average < 7){
            image = #imageLiteral(resourceName: "ic_svetofor_orange")
        }else {
            image = #imageLiteral(resourceName: "ic_svetofor_red")
        }
        setImage(image)
    }
    
    func setImage(_ image: UIImage?) {
        button.setImage(image, for: UIControlState())
    }
    
    func hiddenLabel() {
        label.isHidden = true;
    }
    
    func hiddenTraffic() {
        setImage(#imageLiteral(resourceName: "svetofor_deselect"))
        label.isHidden = true;
    }
    
    deinit {
        print("RNSLightButton deinit")
    }
}
