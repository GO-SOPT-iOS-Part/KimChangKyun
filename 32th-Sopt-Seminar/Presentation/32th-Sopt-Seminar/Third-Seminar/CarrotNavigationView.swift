//
//  CarrotNavigationView.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/27.
//

import UIKit

import SnapKit
import Then

final class CarrotNavigationView: UIView {
    
    private let dongLabel = UILabel()
    private let listButton = UIButton()
    private let searchButton = UIButton()
    private let menuButton = UIButton()
    private let bellButton = UIButton()
    private let rightStackView = UIStackView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func favoriteTab() {
        dongLabel.text = "김창균화이팅!"
    }
}

extension CarrotNavigationView {
    
    private func setUI() {
        
        self.backgroundColor = .white
        
        dongLabel.do {
            $0.text = "남유진화이팅!"
            $0.font = .systemFont(ofSize: 20.0)
            $0.addLineHeight(lineHeight: 25)
        }
        
        listButton.do {
            $0.setImage(.homeListIcon, for: .normal)
        }
        
        searchButton.do {
            $0.setImage(.homeSearchIcon, for: .normal)
        }
        
        menuButton.do {
            $0.setImage(.homeMenuIcon, for: .normal)
        }
        
        bellButton.do {
            $0.setImage(.homeBellIcon, for: .normal)
        }
        
        rightStackView.do {
            $0.axis = .horizontal
            $0.spacing = 13
        }
    }
    
    private func setLayout() {
        self.addSubviews(dongLabel, listButton, searchButton, menuButton, bellButton, rightStackView)
        
        dongLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        listButton.snp.makeConstraints {
            $0.leading.equalTo(dongLabel.snp.trailing).offset(2)
            $0.bottom.equalToSuperview().inset(9)
        }
        
        searchButton.snp.makeConstraints {
            $0.size.equalTo(25)
        }
        
        menuButton.snp.makeConstraints {
            $0.size.equalTo(25)
        }
        
        bellButton.snp.makeConstraints {
            $0.size.equalTo(25)
        }
        
        rightStackView.addArrangedSubviews(searchButton, menuButton, bellButton)
        
        rightStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(25)
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(44)
        }
    }
}
