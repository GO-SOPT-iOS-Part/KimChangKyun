//
//  UIView+.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/04/22.
//

import UIKit

extension UIView {
    
    func makeRounded(radius: CGFloat) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
