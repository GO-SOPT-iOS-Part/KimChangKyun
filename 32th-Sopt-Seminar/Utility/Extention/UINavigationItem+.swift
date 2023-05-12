//
//  UINavigationItem+.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import UIKit

extension UINavigationItem {
    
    func setRightSideButtonUI(_ target: Any?, imageName: UIImage?) -> UIBarButtonItem {
        
        let button = UIButton(type: .system)
        button.setImage((imageName), for: .normal)
        button.tintColor = Color.tvingGray2

        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true

        return barButtonItem
    }
}
