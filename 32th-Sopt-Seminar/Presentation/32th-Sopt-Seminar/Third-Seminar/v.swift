//
//  v.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/01.
//

import UIKit
import SnapKit
import Then

final class v: UIViewController {

    // MARK: - UI Components
    
    private let originView = CommonView()
    // MARK: - Properties

    // MARK: - Initializer

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
}

extension v {

    // MARK: - UI Components Property

    private func setUI() {
        view.backgroundColor = .white
    }

    // MARK: - Layout Helper

    private func setLayout() {
        
        view.addSubview(originView)
        
        originView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Methods

    // MARK: - @objc Methods
}
