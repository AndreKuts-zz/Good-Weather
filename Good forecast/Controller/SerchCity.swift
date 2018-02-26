//
//  SerchCity.swift
//  Good forecast
//
//  Created by 1 on 02.02.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit

class SerchCity: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: DesignableTextField!
    @IBOutlet weak var buttCancel: UIButton!
    @IBOutlet weak var viewForButton: UIView!
    var city: String!
    
    var arrPriorityCities: [String?] = ["Moscow", "London", "Bangkok", "New York", "Minsk"] {
        didSet {
            print(arrPriorityCities)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        designateCity()
        textFieldDesign()
        change()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func selectСity(_ sender: UIButton) {
        if let text = sender.titleLabel?.text {
            self.city = text
            self.view.reloadInputViews()
            performSegue(withIdentifier: "goToViewController", sender: self)
        }
    }
    
    
    func textFieldDesign () {
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 6
        textField.layer.shadowColor = UIColor.lightGray.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    
    
    func change() {
        buttCancel.layer.shadowColor = UIColor.lightGray.cgColor
        buttCancel.layer.shadowRadius = 6
        buttCancel.layer.shadowOpacity = 1.0
        buttCancel.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    
    // Нажатие кнопки Go на клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            self.city = textField.text
            arrPriorityCities = chengeArr(arr: &arrPriorityCities, city: textField.text!)
            self.view.reloadInputViews()
            performSegue(withIdentifier: "goToViewController", sender: self)
            return true
        }
        return false
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToViewController" {
            let destVC = segue.destination as! MainViewController
            if let citys = self.city {
                destVC.city = citys
            }
        }
    }
    
    // Изменить список Приоритетных городов
    func chengeArr (arr: inout [String?], city: String) -> [String?] {
        var array = arr
        
        if checkingForValues(of: city, in: arr) {
            
            
            
        }
        
        array.insert(city, at: 0)
        array.removeLast()
        arr = array
        return array
    }
    
    
    
    // Назначение заглавия для кнопок
    func designateCity () {
        for tag in 0..<arrPriorityCities.count {
            let butt = view.viewWithTag(tag + 1)  as! UIButton
            butt.setTitle(arrPriorityCities[tag], for: .normal)
        }
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
    
}



















