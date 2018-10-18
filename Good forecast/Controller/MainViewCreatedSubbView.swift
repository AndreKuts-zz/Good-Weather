//
//  extensionMainViewCreatedSubbView.swift
//  Good forecast
//
//  Created by 1 on 17.02.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit

extension MainViewController {
    
    // Создание Алерта
    func makeAlertOk (title: String, message: String) {
        let alert = UIAlertController (title: title, message: message , preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - created label для времени
    func makeLabelForView (tmp: Int, arr: [Weather?]) -> UILabel {
        let lab = UILabel ()
        lab.frame = CGRect(x: 25, y: 8, width: 65, height: 48)
        if let a = arr[tmp] {
            let hour = DateServise.getDateHourDate(a)
            lab.text = "\(hour)"
        }
        
        let sizeOfText = UIFont(name: "Helvetica Light", size: 25.0)
        lab.font = sizeOfText
        lab.textColor = .black
        
        return lab
    }
    
    // Создание лейблов для температуры
    func makeLabel (index: Int, arr: [Weather?]) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: myScrolVIew.frame.width - 75, y: 8, width: 48, height: 48)
        if let temperature = arr[index]?.temp{
            label.font = UIFont(name: "Helvetica Light", size: 23.0)
            label.text = "\(lrint(temperature)) º"
        }
        label.textAlignment = .center
        
        return label
    }
    
    // MARK: - Make Scroll
    func createViewInScroll (arr: [Weather?]) {
        var y = 0
        let sizeViewInScrole = 65
        myScrolVIew.contentSize = CGSize(width: self.view.frame.width - 32, height: 472)
        myScrolVIew.bounces = false
        
        for i in 0...8 {
            if i > 7 {
                myScrolVIew.contentSize.height =  (520 + CGFloat(sizeViewInScrole))
            }
            
            let myViewInScroll = UIView()
            myViewInScroll.frame = CGRect(x: 0, y: y, width: Int(self.view.frame.width - 32), height: 64)
            myViewInScroll.backgroundColor = UIColor.init(red: 245, green: 245, blue: 245, alpha: 1.0)
            y += sizeViewInScrole
            myScrolVIew.addSubview(myViewInScroll)
            let label = self.makeLabelForView(tmp: i, arr: arr)

            myViewInScroll.addSubview(label)
            myViewInScroll.addSubview(createdUIImege(image: (arr[i]?.weatherIcon)! + "2"))
            myViewInScroll.addSubview(makeLabel(index: i, arr: arr))
        }
    }
    
    // MARK: - created UIimage
    func createdUIImege (image: String) -> UIImageView {
        let uiImegeView = UIImageView()
        uiImegeView.frame = CGRect(x: myScrolVIew.frame.width - 130, y: 18, width: 32, height: 32)
        uiImegeView.image = UIImage(named: image)
        return uiImegeView
    }
}
