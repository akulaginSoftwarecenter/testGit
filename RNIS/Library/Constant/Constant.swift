//
//  Constant.swift
//  RNIS
//
//  Created by Артем Кулагин on 18.07.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import CoreLocation
let redPlaceLocation = CLLocation(latitude: 55.754289, longitude: 37.619800) //Красная площадь
//var stubLocation: CLLocation?// = CLLocation(latitude: 59.9363783, longitude: 30.3022305) //питер
var stubLocation: CLLocation?// = redPlaceLocation// = CLLocation(latitude: 55.754289, longitude: 37.619800) //Красная площадь

let mapHost = "http://95.213.205.92/"
let mapHost2 = "http://95.213.205.91/"
let mapHost3 = "http://95.181.199.195/"

let serverAddress = ""
//let serverRnisapi = "https://dev-rnisapi.regeora.ru/ajax/request"
let serverRnisapi = "https://api.rnis.mosreg.ru/ajax/request"
let showLogApi = true
let showLogApiDetail = false


let kPhoneVC = "RNSPhoneViewController"
let kEmailVC = "RNSEmailViewController"
let kCodeVC = "RNSCodeViewController"
let kCodeEmailVC = "RNSCodeEmailViewController"
let kParoleVC = "RNSParoleViewController"
let kUuid = "uuid"
let kStrelka = "Стрелка"
let kNews = "Новости"
let kUpdateTime = "updateTime"
let kUpdateLocation = "updateLocation"
let kUpdateFavorite = "updateFavorite"

let kServerNotAviable = "Сервер недоступен"
let kName = "name"
let kMeta = "meta"
let errorNetwork = "Отсутствует подключение к интернету"
let favoriteTitle = "Избранное"
let notificationTitle = "Оповещения"
let kErrorMail = "Введите корректный email"
let minZoomVisibleStop = Int32(14)
let subjectRegister = "com.rnis.mobile.action.mobile_user.register"

let kSearchViewCellDefaultHeight: CGFloat = 59
let kSearchViewCellDistanceRight: CGFloat = 16
let kSearchViewCellDistanceLeft: CGFloat = 5
let kSearchViewCellEdgeDownUp: CGFloat = 4

