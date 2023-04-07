//
//  FirstViewController_1st_Seminar.swift
//  32th-Sopt-First-Seminar
//
//  Created by kyun on 2023/04/01.
//

import UIKit

final class FirstViewController_1st_Seminar: UIViewController {
    
    private let modeLabel: UILabel = {
        let label = UILabel()
        label.text = "화면 스타일: 라이트 모드"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var modeSwitch: UISwitch = {
        let swicth = UISwitch()
        swicth.addTarget(self, action: #selector(onClickSwitch(sender:)), for: UIControl.Event.valueChanged)
        
        return swicth
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        
        textField.addLeftPadding()
        textField.layer.cornerRadius = 8
        
        return textField
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        
        button.layer.cornerRadius = 8
        
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        
        button.layer.cornerRadius = 8
        
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    
    @objc
    func onClickSwitch(sender: UISwitch) {
        
        if(modeSwitch.isOn == true) {
            modeLabel.text = "화면 스타일: 다크 모드"
            modeLabel.textColor = .white
            nameLabel.textColor = .white
            nameTextField.textColor = .white
            nameTextField.setPlaceholderColor(.systemGray3)
            nameTextField.layer.borderColor = UIColor.white.cgColor
            view.backgroundColor = .black
        } else {
            modeLabel.text = "화면 스타일: 라이트 모드"
            modeLabel.textColor = .black
            nameLabel.textColor = .black
            nameTextField.textColor = .black
            nameTextField.setPlaceholderColor(.gray)
            nameTextField.layer.borderColor = UIColor.gray.cgColor
            view.backgroundColor = .white
        }
    }
}

private extension FirstViewController_1st_Seminar {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [modeLabel, modeSwitch,
         nameLabel, nameTextField,
         presentButton, pushButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([modeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                                     modeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     modeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([modeSwitch.topAnchor.constraint(equalTo: modeLabel.topAnchor, constant: 30),
                                     modeSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170)])
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 15),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController() {
        
        let secondViewController = SecondViewController_1st_Seminar()
        secondViewController.modalPresentationStyle = .fullScreen
        
        if let name = nameTextField.text {
            secondViewController.name = name
        }
        
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        
        let secondViewController = SecondViewController_1st_Seminar()
        
        if let name = nameTextField.text {
            secondViewController.name = name
        }
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped() {
        
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()
    }
}

public extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
    func addLeftPadding() {
        
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
    }
}
