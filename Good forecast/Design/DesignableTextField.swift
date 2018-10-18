//
//  DesignableTextField.swift
//  Good forecast
//
//  Created by 1 on 05.02.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var leftImage : UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding : CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    func updateView () {
        if let imege = leftImage {
            leftViewMode = .always
            
            let imegeView = UIImageView(frame: CGRect (x: leftPadding, y: 0, width: 20, height: 20))
            imegeView.image = imege
            
            var width = 20 + leftPadding
            
            if borderStyle == .none || borderStyle == .line {
                 width += 5 
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imegeView)
            
            leftView = view
            
        } else {
            leftViewMode = .never
        }
    }
}
