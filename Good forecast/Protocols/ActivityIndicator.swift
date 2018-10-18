//
//  ActivityIndicator.swift
//  Good forecast
//
//  Created by 1 on 18/10/2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit

protocol ActivityIndicator {
    func showActivityIndicator(inView view: UIView)
    func hideActivityIndicator(inView view: UIView)
}

protocol ActivityIndicatorPresentable {
    var activityIndicator: ActivityIndicator { get }
    
    func showActivityIndicator()
    func hideActivityIndicator()
}

extension ActivityIndicatorPresentable where Self: UIViewController {
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.showActivityIndicator(inView: self.view)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.hideActivityIndicator(inView: self.view)
        }
    }
}
