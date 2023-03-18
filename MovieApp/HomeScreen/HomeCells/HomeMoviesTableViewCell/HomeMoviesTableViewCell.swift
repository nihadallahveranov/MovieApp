//
//  HomeMoviesTableViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 15.03.23.
//

import UIKit
import SnapKit

class HomeMoviesTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Popular"
        label.font = label.customFont(21)
        
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(UIColor(named: "secondaryColor"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        self.contentView.addSubview(button)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        // MARK: not good way
        layout.itemSize = CGSize(width: self.contentView.frame.size.width / 2, height: self.contentView.frame.size.width - 50)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)

        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = UIColor(named: "primaryColor")
        view.hero.id = "ironMan"

        self.contentView.addSubview(view)

        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews() {
        
        self.selectionStyle = .none
        
        self.backgroundColor = UIColor(named: "primaryColor")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.reloadData()
        
        seeAllButton.snp.makeConstraints() { make in
            make.top.equalTo(self.contentView.snp.top).offset(32)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.width.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.contentView.snp.top).offset(32)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.seeAllButton.snp.left).offset(-16)
        }
    
        collectionView.snp.makeConstraints() { make in
            make.top.equalTo(self.titleLabel.snp.top).offset(36)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.bottom.equalTo(self.contentView.snp.bottom)
            // MARK: not good way
            make.height.equalTo(self.contentView.frame.size.width - 50)
        }
    }
    
    func configure() {
        if collectionView.tag == 1 {     // Second Movie Collection
            titleLabel.text = "Trending"
            collectionView.snp.removeConstraints()
            collectionView.snp.makeConstraints() { make in
                make.top.equalTo(self.titleLabel.snp.top).offset(36)
                make.left.equalTo(self.contentView.snp.left)
                make.right.equalTo(self.contentView.snp.right)
                make.bottom.equalTo(self.contentView.snp.bottom)
                // MARK: not good way
                make.height.equalTo(self.contentView.frame.size.width + 50)
            }
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            // MARK: not good way
            layout.itemSize = CGSize(width: self.contentView.frame.size.width - 100, height: self.contentView.frame.size.width + 50)
            layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            
            collectionView.collectionViewLayout = layout
        }
    }

}

extension HomeMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HomeViewModel.shared.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MovieCollectionViewCell {
            cell.configure(item: HomeViewModel.shared.movies[indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.movie = HomeViewModel.shared.movies[indexPath.row]
        
        let detailVCWithNavigation = UINavigationController(rootViewController: detailVC)
        detailVCWithNavigation.modalPresentationStyle = .fullScreen
        
        guard let currentViewController = UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        
        currentViewController.present(detailVCWithNavigation, animated: true)
    }
    
    
}
