//
//  ViewController.swift
//  Good forecast
//
//  Created by 1 on 31.01.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit
import RealmSwift

weak var MainViewControllerDelegate: UIViewController!

class MainViewController: UIViewController {
    
    private let weathserService = OpenWeatherService()
    private let realms = RealmClass()
    
    @IBOutlet weak var buttonWeatherIn: UIButton!
    @IBOutlet weak var buttDate: UIButton!
    @IBOutlet weak var myScrolVIew: UIScrollView!
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var degreesOfWeather: UILabel!
    @IBOutlet weak var nameIconWether: UILabel!
    @IBOutlet weak var viewForPicker: UIView!
    @IBOutlet weak var pickerViewDay: UIPickerView!
    @IBOutlet weak var ViewForActivityScroll: UIView!
    @IBOutlet weak var activityScroll: UIActivityIndicatorView!
    
    var weatherForSelectDay = ["Today", "Tomorrow", " ", " ", " ", " "]
    var day: Int!
    
    var weather = [Weather?]() {
        didSet {
            buttDate.setTitle(DateServise.getDayFullDate(weather[0]!), for: .normal)
            self.centralImegeAndDegreesView(arr: weather)
            self.createViewInScroll(arr: weather)
            self.buttonWeatherIn.setTitle("Weather in \(self.city!)", for: UIControlState.normal)
            self.weatherForSelectDay = arrDaysOfLoadedWeather(arr: weather)
        }
    }

    var city: String! {
        didSet {
            ViewForActivityScroll.isHidden = false
            activityScroll.startAnimating()
            
            weathserService.loadWeatherData(city: city) { [weak self] weather in
                if weather.isEmpty {
                    self?.present((self?.weathserService.enteredIncorrectlycity(self?.city))!, animated: true, completion: nil)
                } else {
                    self?.weather = weather
                    self?.ViewForActivityScroll.isHidden = true
                    self?.activityScroll.stopAnimating()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        MainViewControllerDelegate = self
        change(butt: buttonWeatherIn)
        change(butt: buttDate)
    }
    
    // desing Button
    func change(butt: UIButton) {
        butt.layer.shadowColor = UIColor.lightGray.cgColor
        butt.layer.shadowRadius = 6
        butt.layer.shadowOpacity = 1.0
        butt.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    
    // MARK: - кнопки для пикерВиюДаты
    @IBAction func getWeatherForDay(_ sender: UIButton) {
        self.viewForPicker.isHidden = true
        pickerViewDay.reloadAllComponents()
    }

    @IBAction func setDateForWeather(_ sender: UIButton) {
        self.viewForPicker.isHidden = false
        pickerViewDay.reloadAllComponents()
    }
    
    // Изменение Имедже и градусов
    private func centralImegeAndDegreesView (arr: [Weather?]) {
        if arr[0]?.temp != nil {
            self.degreesOfWeather.text = "\(Int((arr[0]?.temp)!))"
            self.iconWeather.image = UIImage(named: (arr[0]?.weatherIcon)!)
            self.nameIconWether.text = arr[0]?.weatherName
        }
    }
    
    //MARK: - Navigate
    @IBAction func unwindeSegue ( _ sender: UIStoryboardSegue) {
    }
    
    func setIconeForButton () {
        if let imege = buttonWeatherIn.imageView {
            imege.image = UIImage(named: "city-search")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSerchCity" {
            if self.viewForPicker.isHidden {
                self.viewForPicker.isHidden = true
            } else {
                self.viewForPicker.isHidden = true
            }
        }
    }
}
