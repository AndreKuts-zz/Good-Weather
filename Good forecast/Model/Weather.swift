//
//  WeatherServis.swift
//  Good forecast
//
//  Created by 1 on 31.01.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//


import Foundation
import SwiftyJSON
import RealmSwift

class Weather: Object {
    
    @objc dynamic var date = 0.0
    @objc dynamic var temp = 0.0
    @objc dynamic var pressure = 0.0
    @objc dynamic var humidity = 0
    @objc dynamic var weatherName = ""
    @objc dynamic var weatherIcon = ""
    @objc dynamic var windSpeed = 0.0
    @objc dynamic var windDegrees = 0.0
    @objc dynamic var city = ""

    convenience init(json: JSON, city: String) {
        
        self.init()
        
        self.date = json["dt"].doubleValue
        self.temp = json["main"]["temp"].doubleValue
        self.pressure = json["main"]["pressure"].doubleValue
        self.humidity = json["main"]["humidity"].intValue
        self.weatherName = json["weather"][0]["main"].stringValue
        self.weatherIcon = json["weather"][0]["icon"].stringValue
        self.windSpeed = json["wind"]["speed"].doubleValue
        self.windDegrees = json["wind"]["deg"].doubleValue
        self.city = city
    }
}



//    override static func indexedProperties() -> [String] {
//        return ["date"]
//    }
    
//    override static func ignoredProperties() -> [String] {
//        return ["windDegrees", "windSpeed", "pressure", "humidity"]
//    }
    






