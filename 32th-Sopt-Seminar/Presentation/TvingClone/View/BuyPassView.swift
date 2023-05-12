//
//  BuyPassView.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class BuyPassView: UIView {
    
    private let buyPassLabel = UILabel()
    private let subscriptionAttach = NSTextAttachment()
    private lazy var buyPassButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BuyPassView {
    
    private func setUI() {
        
        backgroundColor = Color.tvingGray5
        
        subscriptionAttach.do {
            $0.image = Image.tvnJtbcLogo
        }
        
        buyPassLabel.do {
            let firstString = NSMutableAttributedString(string: "이용권을 구매하고  ")
            let logoImg = NSAttributedString(attachment: subscriptionAttach)
            let secondString = NSAttributedString(string: " 등 인기 TV프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!")
            $0.labelWithImg(composition: firstString, logoImg, secondString, spacing: 7)
            $0.textColor = Color.tvingGray2
            $0.font = .systemFont(ofSize: 12)
            $0.numberOfLines = 2
        }
        
        buyPassButton.do {
            $0.setImage(Image.rightChevronIcon, for: .normal)
        }
    }
    
    private func setLayout() {
        
        addSubviews(buyPassLabel, buyPassButton)
        
        buyPassLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(18)
            $0.height.equalTo(38)
        }
        
        buyPassButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(13)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(18)
        }
    }
}
