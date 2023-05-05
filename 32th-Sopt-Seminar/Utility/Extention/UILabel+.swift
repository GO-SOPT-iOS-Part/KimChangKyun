//
//  UILabel+.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import UIKit

extension UILabel {
    
    // string과 이미지합쳐주고 줄 간격 주는 익스텐션
    func labelWithImg(composition: NSAttributedString..., spacing: CGFloat) {
        
        let attributedString = NSMutableAttributedString()
        
        for i in composition {
            attributedString.append(i)
        }
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle,
                                      value: style,
                                      range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
}
