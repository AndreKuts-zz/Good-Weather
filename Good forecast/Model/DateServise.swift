//
//  DateServise.swift
//  Good forecast
//
//  Created by 1 on 13.02.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import Foundation


class DateServise {

    static func getDateHourDate (_ weathe: Weather) -> String {
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weathe.date)
        df.dateFormat = "HH:mm"
        let dateString = df.string(from: date)
        
        return dateString
    }
    
    static func getDayOfWeakDate (_ weathe: Weather) -> String {
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weathe.date)
        df.dateFormat = "EEEE"
        let dateString = df.string(from: date)
        
        return dateString
    }
    
    static func getDayFullDate (_ weathe: Weather) -> String {
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weathe.date)
        df.dateFormat = "EEE, d MMMM, Y"
        let dateString = df.string(from: date)
        
        return dateString
    }

    static func getWeakDayAndDay (_ weathe: Weather) -> String {
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weathe.date)
        df.dateFormat = "EEE,  d  MMM"
        let dateString = df.string(from: date)
        
        return dateString
    }

    static func getDay (_ weathe: Weather) -> Int {
        let df = DateFormatter()
        let date = Date(timeIntervalSince1970: weathe.date)
        df.dateFormat = "d"
        let dateString = df.string(from: date)
        let resolt = Int(dateString)
        return resolt!
    }
}
