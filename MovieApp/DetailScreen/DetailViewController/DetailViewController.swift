//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 17.03.23.
//

import UIKit
import Hero
import Lottie

class DetailViewController: UIViewController {

    private var boolean = false
    var movie: Movie?
    
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
        self.view.backgroundColor = UIColor(named: "primaryColor")
        self.view.hero.isEnabled = true
        self.view.hero.id = "ironMan"
        self.navigationItem.title = "Detail"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(DetailHeaderTableViewCell.self, forCellReuseIdentifier: "DetailHeaderTableViewCell")
        tableView.register(DetailTitleTableViewCell.self, forCellReuseIdentifier: "DetailTitleTableViewCell")
        tableView.register(DetailSegmentControlTableViewCell.self, forCellReuseIdentifier: "DetailSegmentControlTableViewCell")
        
        let backButtonImage = UIImage(systemName: "arrow.left")
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = UIColor(named: "secondaryColor")
        navigationItem.leftBarButtonItem = backButton
        
        
        let bookmarkButtonImage = UIImage(systemName: "bookmark")
        let bookmarkButton = UIBarButtonItem(image: bookmarkButtonImage, style: .plain, target: self, action: #selector(bookmarkButtonTapped))
        bookmarkButton.tintColor = UIColor(named: "secondaryColor")
        navigationItem.rightBarButtonItem = bookmarkButton
        
        tableView.snp.makeConstraints() { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func bookmarkButtonTapped() {
        boolean = !boolean
        let bookmarkButtonImage = boolean ? UIImage(systemName: "bookmark.fill")! : UIImage(systemName: "bookmark")!
        let bookmarkButton = UIBarButtonItem(image: bookmarkButtonImage, style: .plain, target: self, action: #selector(bookmarkButtonTapped))
        bookmarkButton.tintColor = UIColor(named: "secondaryColor")
        navigationItem.rightBarButtonItem = bookmarkButton
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailHeaderTableViewCell", for: indexPath) as? DetailHeaderTableViewCell {
                cell.configure(item: movie)
                return cell
            }
            
            return UITableViewCell()
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTitleTableViewCell", for: indexPath) as? DetailTitleTableViewCell {
                cell.configure(item: movie)
                return cell
            }
            
            return UITableViewCell()
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSegmentControlTableViewCell", for: indexPath) as? DetailSegmentControlTableViewCell {
                if let movie = movie {
                    DetailViewModel.shared.fetchYoutubeTrailer(imDbId: movie.imdbCode!) { [weak self] in
                        guard let _ = self else { return }
                    }
                }
                cell.configure(item: movie)
                return cell
            }
            
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    
}
