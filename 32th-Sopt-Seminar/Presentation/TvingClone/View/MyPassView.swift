//
//  MyPassView.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class MyPassView: UIView {
    
    private let passIcon = UIImageView()
    private let passLabel = UILabel()
    private let passStatusLabel = UILabel()
    private let cashIcon = UIImageView()
    private let cashLabel = UILabel()
    private let cashStatusLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPassView {
    
    private func setUI() {
        
        backgroundColor = Color.tvingGray5
        
        passIcon.do {
            $0.image = Image.myPassImg
            $0.tintColor = Color.tvingGray3
        }
        
        passLabel.do {
            $0.text = "나의 이용권"
            $0.font = .systemFont(ofSize: 13)
            $0.textColor = Color.tvingGray3
        }
        
        passStatusLabel.do {
            $0.text = "사용중인 이용권이 없습니다."
            $0.font = .systemFont(ofSize: 13)
            $0.textColor = Color.tvingGray3
        }
        
        cashIcon.do {
            $0.image = Image.tvingCashImg
            $0.tintColor = Color.tvingGray3
        }
        
        cashLabel.do {
            $0.text = "티빙캐시"
            $0.font = .systemFont(ofSize: 13)
            $0.textColor = Color.tvingGray3
        }
        
        cashStatusLabel.do {
            $0.text = "0"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = Color.tvingWhite
        }
    }
    
    private func setLayout() {
        
        addSubviews(passIcon, passLabel, passStatusLabel,
                    cashIcon, cashLabel, cashStatusLabel)
        
        passIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(11)
            $0.width.height.equalTo(18)
        }
        
        passLabel.snp.makeConstraints {
            $0.top.equalTo(passIcon)
            $0.leading.equalTo(passIcon.snp.trailing).offset(5)
            $0.height.equalTo(18)
        }
        
        passStatusLabel.snp.makeConstraints {
            $0.top.equalTo(passIcon)
            $0.trailing.equalToSuperview().inset(13)
            $0.height.equalTo(18)
        }
        
        cashIcon.snp.makeConstraints {
            $0.top.equalTo(passIcon.snp.bottom).offset(17)
            $0.leading.equalTo(passIcon)
            $0.width.height.equalTo(18)
        }
        
        cashLabel.snp.makeConstraints {
            $0.top.equalTo(cashIcon)
            $0.leading.equalTo(cashIcon.snp.trailing).offset(5)
            $0.height.equalTo(18)
        }
        
        cashStatusLabel.snp.makeConstraints {
            $0.top.equalTo(cashIcon)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}
