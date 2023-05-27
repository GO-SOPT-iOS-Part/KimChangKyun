//
//  UIStackView.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/27.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
}
