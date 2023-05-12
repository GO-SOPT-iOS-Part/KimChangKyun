//
//  NSObject+.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import Foundation

extension NSObject {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
