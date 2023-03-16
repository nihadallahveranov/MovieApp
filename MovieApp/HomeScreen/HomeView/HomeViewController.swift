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
        
        view.backgroundColor = UIColor(named: "primaryColor")
        
        HomeViewModel.shared.fetchMovies() { [weak self] in
            guard let self = self else { return }
            self.setupViews()
            self.tableView.reloadData()
        }
    }
    
    func setupViews() {
        view.hero.isEnabled = true
        view.hero.id = "ironMan"
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeHeaderTableViewCell.self, forCellReuseIdentifier: "HomeHeaderTableViewCell")
        tableView.register(HomeMoviesTableViewCell.self, forCellReuseIdentifier: "HomeMoviesTableViewCell")
        
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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            print("first")
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeaderTableViewCell", for: indexPath) as! HomeHeaderTableViewCell
            
            return cell
        case 1:
            print("second")
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoviesTableViewCell", for: indexPath) as! HomeMoviesTableViewCell
            cell.collectionView.tag = 0
            return cell
        case 2:
            print("third")
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeMoviesTableViewCell", for: indexPath) as! HomeMoviesTableViewCell
            cell.collectionView.tag = 1
            cell.configure()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
