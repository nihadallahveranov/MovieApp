//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 13.03.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor(named: "primaryColor")
        view.hero.isEnabled = true
        view.hero.id = "ironMan"
        
        self.view.addSubview(view)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.hero.isEnabled = true
        view.hero.id = "ironMan"
        view.backgroundColor = UIColor(named: "primaryColor")
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeHeaderTableViewCell.self, forCellReuseIdentifier: "HomeHeaderTableViewCell")
        tableView.register(HomeFirstMoviesTableViewCell.self, forCellReuseIdentifier: "HomeFirstMoviesTableViewCell")
        
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            print("first")
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeaderTableViewCell", for: indexPath) as! HomeHeaderTableViewCell
            
            return cell
        case 1:
            print("second")
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFirstMoviesTableViewCell", for: indexPath) as! HomeFirstMoviesTableViewCell
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
