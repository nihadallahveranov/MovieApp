//
//  TabBarViewController.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 13.03.23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarController()
    }
    
    func setupTabBarController() {
        let homeTabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house"), selectedImage: UIImage(named: "house.fill"))
        
        let bookTabBarItem = UITabBarItem(title: "book", image: UIImage(systemName: "book"), selectedImage: UIImage(named: "book.fill"))
        
        let homeVC = HomeViewController()
        
        homeVC.tabBarItem = homeTabBarItem
        
        let viewControllers = [
            homeVC,
        ]
                
        self.viewControllers = viewControllers
        
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
    }

}
