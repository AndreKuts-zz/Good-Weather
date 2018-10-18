//
//  WeatherService.swift
//  Good forecast
//
//  Created by 1 on 05.02.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class OpenWeatherService {
    
    let baseUrl = "https://api.openweathermap.org"
    let apiKey = "356d537d0b012ce18e2c757137a144d8"
    
    var realm = RealmClass()
    
    // Load URl Alamofire
    func loadWeatherData(city: String, completion: @escaping ([Weather]) -> Void)  {
        
        let path = "/data/2.5/forecast"
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey /*,
            "cnt" : "40" */
        ]
        
        // Request
        let url = baseUrl+path
        Alamofire.request(url, method: .get, parameters: parameters).responseData { repsons in
            guard let data = repsons.data else {
                return
            }
            print(data)
            let json = try? JSON(data: data)
            
            if json!["cod"] == "404" {
                let weatherError = [Weather]()
                completion(weatherError)
                print(json ?? "b")
                return
            }
            
            let weathers = json!["list"].flatMap { Weather(json: $0.1, city: city) }
            self.realm.saveWeatherData(weathers, city: city)
            completion (weathers)
        }
    }
    
    // Wrong sity
    func enteredIncorrectlycity(_ city: String?) -> UIAlertController {
        let alert = UIAlertController(title: "City (\(city ?? "")) not found", message: "Try to enter the correct city", preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction (title: "ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(alertAction)
        
        return alert
    }
}
