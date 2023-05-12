//
//  MyPageViewController.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/05.
//

import UIKit

class MyPageViewController: UIViewController {
    
    private let myPageTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    private let tableViewFirstDummy = MyPageModel.firstmyPageListdummyData()
    private let tableViewSecondDummy = MyPageModel.secondmyPageListdummyData()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setNavigationBarUI()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension MyPageViewController {
    
    func setNavigationBarUI() {
        
        navigationController?.navigationBar.tintColor = Color.tvingWhite
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        let notification = navigationItem.setRightSideButtonUI(self, imageName: UIImage(systemName: "bell"))
        let setting = navigationItem.setRightSideButtonUI(self, imageName: UIImage(systemName: "gearshape"))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 10
        navigationItem.rightBarButtonItems = [setting, spacer, notification]
    }
    
    func setUI() {
        
        view.backgroundColor = Color.tvingBlack
        
        myPageTableView.do {
            $0.backgroundColor = Color.tvingBlack
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            
            $0.registerReusableView(MyPageHeaderView.self)
            $0.registerCell(MyPageTableViewCell.self)
        }
    }
    
    func setLayout() {
        
        view.addSubview(myPageTableView)
        myPageTableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setDelegate() {
        
        myPageTableView.delegate = self
        myPageTableView.dataSource = self
    }
    
    @objc func backButtonTapped() {
        //        self.navigationController?.popViewController(animated: false)
    }
}

extension MyPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch(section){
        case 0:
            return 5
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myPageTableView.dequeueCell(type: MyPageTableViewCell.self, indexPath: indexPath)
        cell.selectionStyle = .none
        
        switch(indexPath.section) {
        case 0:
            cell.setDataBind(model: tableViewFirstDummy[indexPath.item])
            
            return cell
        case 1:
            cell.setDataBind(model: tableViewSecondDummy[indexPath.item])
            
            return cell
        default:
            let cell = UITableViewCell()
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch(section) {
        case 0:
            let headerView = myPageTableView.dequeueReusableView(type: MyPageHeaderView.self)
            
            return headerView
        default:
            let view = UIView()
            
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch(section) {
        case 0:
            return 310
        default:
            return 0
        }
    }
}

extension MyPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 54
    }
}
