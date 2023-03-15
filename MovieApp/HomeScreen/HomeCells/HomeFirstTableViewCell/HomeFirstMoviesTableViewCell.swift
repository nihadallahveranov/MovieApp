//
//  HomeFirstMoviesTableViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 15.03.23.
//

import UIKit
import SnapKit

class HomeFirstMoviesTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Popular"
        label.font = label.customFont(21)
        
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // MARK: not good way
        layout.itemSize = CGSize(width: (self.contentView.frame.size.width / 2), height: self.contentView.frame.size.width - 100)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)

        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = UIColor(named: "primaryColor")
//        view.backgroundColor = .white
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
        
        self.backgroundColor = UIColor(named: "primaryColor")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.reloadData()
        
        collectionView.snp.makeConstraints() { make in
            make.top.equalTo(self.contentView.snp.top).offset(32)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.bottom.equalTo(self.contentView.snp.bottom)
            // MARK: not good way
            make.height.equalTo(self.contentView.frame.size.width - 100)
        }
    }

}

extension HomeFirstMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MovieCollectionViewCell {
            
//            cell.configure(item: viewModel.list[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
