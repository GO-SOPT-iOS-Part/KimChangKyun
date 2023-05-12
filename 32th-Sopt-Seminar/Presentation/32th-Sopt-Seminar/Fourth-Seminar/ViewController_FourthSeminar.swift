//
//  ViewController_FourthSeminar.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/06.
//

import UIKit

final class ViewController_FourthSeminar: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
   
        signUp()
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "seungchan@naver.com",
                                    nickname: "godios",
                                    password: "Qwer1234!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
