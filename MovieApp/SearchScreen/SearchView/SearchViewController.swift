//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 15.03.23.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let viewModel = SearchViewModel()
    
    private lazy var movieSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        self.view.addSubview(searchBar)
        return searchBar
    }()
    
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
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        viewModel.movies = []
        tableView.reloadData()
        movieSearchBar.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(named: "primaryColor")
        movieSearchBar.searchBarStyle = .minimal
        movieSearchBar.placeholder = "Search"
        movieSearchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.register(SearchNotFoundTableViewCell.self, forCellReuseIdentifier: "SearchNotFoundTableViewCell")
        
        tableView.reloadData()
        
        movieSearchBar.snp.makeConstraints() { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalTo(self.view.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).offset(-16)
        }
        
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(self.movieSearchBar.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }

}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.movies.count == 0 {
            return 1
        }
        
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.movies.count == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchNotFoundTableViewCell", for: indexPath) as? SearchNotFoundTableViewCell {
                cell.configure(height: tableView.frame.size.height)
                return cell
            }
            return UITableViewCell()
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell {
            cell.configure(item: viewModel.movies[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            let text = searchText.replacingOccurrences(of: " ", with: "%20")
            viewModel.fetchMovies(searchText: text) { [weak self] in
                guard let self = self else { return }
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel.movies = []
            self.tableView.reloadData()
        }
    }
}
