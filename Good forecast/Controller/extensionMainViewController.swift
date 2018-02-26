//
//  extensionMainViewController.swift
//  Good forecast
//
//  Created by 1 on 14.02.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import Foundation
import UIKit


extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weatherForSelectDay.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weatherForSelectDay[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.day = row
    }
    
    
    
    // Возвращаем массив дней уже строковый вариант, наполение массива уникальными днямы
    func arrDaysOfLoadedWeather(arr: [Weather?]) -> [String] {
        var resolt = [String]()
        for i in arr {
            let strDay = DateServise.getWeakDayAndDay(i!)
            if !checkingForValues(of: strDay, in: resolt) {
                resolt.append(strDay)
            }
        }
        return resolt
    }
    
    
    
    // Проверка массива на наличие значения
    func checkingForValues <T: Equatable> (of valueToFind: T, in array: [T?]) -> Bool {
        for item in array {
            if item == valueToFind {
                return true
            }
        }
        return false
    }
    
    
    
    func selectedWeaerDay(arr: [Weather?], day: Int) -> [Weather?] {
        
        var weatherR = [[Weather?](), [Weather?](), [Weather?](), [Weather?](), [Weather?](), [Weather?]()]
        var dayInt = [DateServise.getDay(arr[0]!)]
        var tmp = 0
        
        for i in arr {
            let days = DateServise.getDay(i!)
            if checkingForValues(of: days, in: dayInt) {
                weatherR[tmp].append(i)
                tmp += 1
            } else {
                dayInt.append(days)
                weatherR[tmp].append(i)
            }
        }
        return weatherR[day]
    }
    
    
    // MARK: - Возвращает массив погоды для выбраного дня
    // Выбрать погодогу для определенного дня!
    //    func createdArrDayWeather (number selectedDay: Int, allWEather: [Weather?]) -> [Weather?] {
    //
    //        let day = selectedDay * 8
    //        print(selectedDay)
    //        switch selectedDay {
    //        case 0: return fori(day: day, arr: allWEather)
    //        case 1: return fori(day: day, arr: allWEather)
    //        case 2: return fori(day: day, arr: allWEather)
    //        case 3: return fori(day: day, arr: allWEather)
    //        case 4: return fori(day: day, arr: allWEather)
    //        default:
    //            makeAlertOk(title: "Выберите день", message: "Погоду можно посмотреть только на 5 дней")
    //            return allWEather
    //        }
    //    }
    
    
    //Маленькая функция для определения массива погоды
    //    func fori (day: Int, arr: [Weather?]) -> [Weather?] {
    //        var resolt = [Weather?]()
    //        for i in day...(day + 8) {
    //            resolt.append(arr[i]!)
    //        }
    //        return resolt
    //    }
    
    
    
    
    
    
    
    
}


