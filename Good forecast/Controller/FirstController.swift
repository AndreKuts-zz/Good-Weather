//
//  FirstController.swift
//  Good forecast
//
//  Created by 1 on 17.02.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit

class FirstController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if textField.text == nil {
//
//        } else {
//            self.performSegue(withIdentifier: "goToMainView", sender: self)
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    
//    // Нажатие кнопки GO
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.performSegue(withIdentifier: "goToMainView", sender: self)
//        return true
//    }
//    
//    
//
//    
//    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "goToMainView" {
//            let destVC = segue.destination as! MainViewController
//            if let city = textField.text {
//                destVC.city = city
//            }
//        }
//        
//    }
//    

}








































