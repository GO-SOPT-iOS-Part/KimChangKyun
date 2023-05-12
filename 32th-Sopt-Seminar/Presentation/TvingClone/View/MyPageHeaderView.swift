//
//  MyPageHeaderView.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class MyPageHeaderView: UITableViewHeaderFooterView {
    
    private let myProfileView = MyProfileView()
    private let myPassView = MyPassView()
    private let buyPassView = BuyPassView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPageHeaderView {
    
    private func setUI() {
        
        myPassView.do {
            $0.layer.cornerRadius = 3
        }
        
        buyPassView.do {
            $0.layer.cornerRadius = 3
        }
    }
    
    private func setLayout() {
        
        addSubviews(myProfileView, myPassView, buyPassView)
        
        myProfileView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(138)
        }
        
        myPassView.snp.makeConstraints {
            $0.top.equalTo(myProfileView.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(92)
        }
        
        buyPassView.snp.makeConstraints {
            $0.top.equalTo(myPassView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
    }
}
