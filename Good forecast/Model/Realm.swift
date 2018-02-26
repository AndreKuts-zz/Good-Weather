//
//  Realm.swift
//  Good forecast
//
//  Created by 1 on 05.02.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import RealmSwift

class RealmClass {
    
    func saveWeatherData(_ weathers: [Weather], city: String) {
        do {
            let realm = try Realm()
            let oldWeathers = realm.objects(Weather.self).filter("city == %@", city)
            realm.beginWrite()
            realm.delete(oldWeathers)
            realm.add(weathers)
            print(realm.configuration.fileURL ?? "??")
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    
    
    func loadData(arr: inout [Weather?]) {
        do {
            let realm = try Realm()
            let weathers = realm.objects(Weather.self).filter("city == %@", realm.objects(Weather.self)[0].city)
            arr = Array(weathers)
        } catch {
            print(error)
        }
    }
}




