//
//  FirstViewController_Practice1.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/04/08.
//

import UIKit

import SnapKit
import Then

final class FirstViewController_Practice1: UIViewController {
    
    private var count = 0 {
        didSet {
            self.countLabel.text = count > 10 ? "10번 이상 눌렀네.. \(count)" : "조금만 더 눌러바.. \(count)"
        }
    }
    
    private let countLabel = UILabel()
    private lazy var nextButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

private extension FirstViewController_Practice1 {
    
    func setStyle() {
        
        view.backgroundColor = .white
        
        countLabel.do {
            $0.backgroundColor = .black
            $0.text = "버튼 탭 횟수는 ?!"
            $0.font = .boldSystemFont(ofSize: 30)
            $0.textColor = .white
            $0.textAlignment = .center
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
        }
        
        nextButton.do {
            $0.setTitle("다음으로!", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .blue
            nextButton.layer.cornerRadius = 8
            $0.addTarget(self,
                         action: #selector(nextButtonTapped),
                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        [countLabel, nextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width - 40)
            $0.height.equalTo(80)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(10)
            $0.size.equalTo(100)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc
    func nextButtonTapped() {
        
        let viewController = SecondViewController_Practice1()
        
        viewController.delegate = self
        
        self.present(viewController, animated: true)
    }
}

extension FirstViewController_Practice1: TapButton {
    
    func buttonTapped(count: Int) {
        self.count = count
    }
}
