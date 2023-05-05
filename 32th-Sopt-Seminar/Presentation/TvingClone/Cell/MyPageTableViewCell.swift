//
//  MyPageTableViewCell.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import UIKit

import SnapKit
import Then

final class MyPageTableViewCell: UITableViewCell {
    
    let cellLabel = UILabel()
    let forwardButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPageTableViewCell {
    
    func setUI() {
        
        backgroundColor = Color.tvingBlack
        
        cellLabel.do {
            $0.font = .systemFont(ofSize: 15) // 나중에 추가할 예정
            $0.textColor = Color.tvingGray2
        }
        
        forwardButton.do {
            $0.setImage(Image.rightChevronIcon, for: .normal)
        }
    }
    
    func setLayout() {
        
        addSubviews(cellLabel, forwardButton)
        
        
        cellLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        forwardButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(18)
        }
    }
    
    func setDataBind(model: MyPageModel) {
        
        cellLabel.text = model.list
    }
}
