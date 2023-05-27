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
    
    func addLineHeight(lineHeight: CGFloat) {
        
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - font.lineHeight) / 4
            ]
            
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
            self.textAlignment = .center
        }
    }
    
    func addLetterSpacing(_ value: Double) {
        
        let kernValue = self.font.pointSize * CGFloat(value)
        
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
    
    func underlineText() {
        
        guard let labelText = text else { return }
        
        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString
    }
    
    func setTextWithLineHeight(text: String?, lineHeight: CGFloat){
        
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - font.lineHeight) / 4
            ]
            
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
        }
    }
}
