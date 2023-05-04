//
//  ViewController_Practice2.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/04/08.
//

import UIKit

import SnapKit
import Then

final class ViewController_Practice2: UIViewController {
    
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private let fourthView = UIView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

private extension ViewController_Practice2{
    
    func setStyle() {
        
        view.backgroundColor = .white
        
        firstView.do {
            $0.backgroundColor = .yellow
        }
        
        secondView.do {
            $0.backgroundColor = .green
        }
        
        thirdView.do {
            $0.backgroundColor = .black
        }
        
        fourthView.do {
            $0.backgroundColor = .systemBlue
        }
    }
    
    func setLayout() {
        
        [firstView, secondView, thirdView, fourthView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        
        firstView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        
        secondView.snp.makeConstraints {
            $0.top.equalTo(firstView.snp.bottom)
            $0.leading.equalTo(firstView.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        
        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        
        fourthView.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom)
            $0.leading.equalTo(thirdView.snp.trailing)
            $0.width.equalTo(UIScreen.main.bounds.width / 2)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
    }
}
