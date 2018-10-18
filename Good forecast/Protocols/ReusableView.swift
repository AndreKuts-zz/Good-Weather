//
//  ReusableView.swift
//  Good forecast
//
//  Created by 1 on 18/10/2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

protocol ReusableView: class {}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
