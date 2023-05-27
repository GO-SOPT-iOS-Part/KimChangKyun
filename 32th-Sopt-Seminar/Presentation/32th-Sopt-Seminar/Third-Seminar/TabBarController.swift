//
//  TabBarController.swift
//  32th-Sopt-Seminar
//
//  Created by kyun on 2023/05/27.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setTabBar()
    }
}

extension TabBarController {
    
    private func makeTabBar(viewController: UIViewController,
                            title: String,
                            tabBarImg: UIImage,
                            tabBarSelectedImg: UIImage,
                            renderingMode: UIImage.RenderingMode) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title,
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        
        return tab
    }
    
    private func setTabBar() {
        
        let home = makeTabBar(viewController: CarrotViewController(),
                              title: "홈",
                              tabBarImg: .defaultHomeIcon,
                              tabBarSelectedImg: .hoverHomeIcon,
                              renderingMode: .alwaysTemplate)
        let favorite = makeTabBar(viewController: FavoriteViewController(),
                            title: "즐겨찾기",
                            tabBarImg: .defaultMyIcon,
                            tabBarSelectedImg: .hoverMyIcon,
                            renderingMode: .alwaysTemplate)
        
        let tabs = [home, favorite]
        
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
    }
}
