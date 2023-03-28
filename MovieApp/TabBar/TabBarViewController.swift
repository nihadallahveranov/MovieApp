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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setupTabBarController() {
        let homeTabBarItem = UITabBarItem(title: "Home",
                                          image: UIImage(named: "home-bar-icon"),
                                          selectedImage: UIImage(named: "home-bar-icon"))
        
        let searchTabBarItem = UITabBarItem(title: "Search",
                                            image: UIImage(systemName: "magnifyingglass"),
                                            selectedImage: UIImage(systemName: "magnifyingglass"))
        
        let watchlistTabBarItem = UITabBarItem(title: "Watch list",
                                               image: UIImage(systemName: "bookmark"),
                                               selectedImage: UIImage(systemName: "bookmark"))
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let watchlistVC = UINavigationController(rootViewController: WatchListViewController())
        
        homeVC.tabBarItem = homeTabBarItem
        searchVC.tabBarItem = searchTabBarItem
        watchlistVC.tabBarItem = watchlistTabBarItem
        
        let viewControllers = [
            homeVC,
            searchVC,
            watchlistVC,
        ]
                
        self.viewControllers = viewControllers
        
        self.tabBar.tintColor = UIColor(named: "secondaryColor")
        self.tabBar.backgroundColor = UIColor(named: "primaryColor")
        
        let topBorderLayer = CALayer()
        topBorderLayer.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1)
        topBorderLayer.backgroundColor = UIColor(named: "secondaryColor")?.cgColor
        tabBar.layer.addSublayer(topBorderLayer)    
    }

}
