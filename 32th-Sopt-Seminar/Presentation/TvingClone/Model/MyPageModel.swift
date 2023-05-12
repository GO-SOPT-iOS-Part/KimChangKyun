//
//  MyPageModel.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import UIKit

struct MyPageModel {
    let list: String
}

extension MyPageModel {
    
    static func firstmyPageListdummyData() -> [MyPageModel] {
        return [
            MyPageModel(list: "이용권"),
            MyPageModel(list: "1:1 문의내역"),
            MyPageModel(list: "예약알림"),
            MyPageModel(list: "회원정보 수정"),
            MyPageModel(list: "프로모션 정보 수신 동의")
        ]
    }
    
    static func secondmyPageListdummyData() -> [MyPageModel] {
        return [
            MyPageModel(list: "공지사항"),
            MyPageModel(list: "이벤트"),
            MyPageModel(list: "고객센터"),
            MyPageModel(list: "티빙 알아보기")
        ]
    }
}
