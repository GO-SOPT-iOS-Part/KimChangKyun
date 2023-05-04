//
//  Int+.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import Foundation

extension Int {
    
    var priceText: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            var priceString = numberFormatter.string(for: self) ?? "-1"
            priceString = priceString + "원"
            return priceString
        }
    }
}
