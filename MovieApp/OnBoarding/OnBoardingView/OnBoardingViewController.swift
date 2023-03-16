//
//  OnBoardingViewController.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 13.03.23.
//

import UIKit
import SnapKit
import Hero

class OnBoardingViewController: UIViewController {

    private let viewModel = OnBoardingViewModel()
    
    private var currentPage: Int = 0 {
        didSet {
            didCurrentPageChange()
        }
    }
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next →", for: .normal)
        button.setTitleColor(UIColor(named: "secondaryColor"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        self.view.addSubview(button)
        
        return button
    }()
    
    private lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.isUserInteractionEnabled = false
        view.currentPage = 0
        view.numberOfPages = viewModel.list.count
        view.pageIndicatorTintColor = .lightGray
        view.currentPageIndicatorTintColor = UIColor(named: "secondaryColor")
        
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height - 250)

        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.register(OnBoardingCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = UIColor(named: "primaryColor")
        view.isPagingEnabled = true
        view.isUserInteractionEnabled = false
        view.hero.isEnabled = true
        view.hero.id = "ironMan"

        self.view.addSubview(view)

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.getItems()
        collectionView.reloadData()

        setupViews()
    }
    
    func setupViews() {
        
        self.view.backgroundColor = UIColor(named: "primaryColor")
        
        nextButton.snp.makeConstraints() { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.right.equalTo(self.view.snp.right).offset(-16)
            make.height.equalTo(50)
        }
        
        pageControl.snp.makeConstraints() { make in
            make.bottom.equalTo(self.nextButton.snp.top).offset(-16)
            make.centerX.equalTo(self.view)
        }
        
        collectionView.snp.makeConstraints() { make in
            make.bottom.equalTo(self.pageControl.snp.top).offset(-8)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
    }
    
    @objc func didTapNextButton() {
        currentPage += 1
        
        if currentPage < viewModel.list.count {
            collectionView.isPagingEnabled = false

            let nextIndexPath = IndexPath(item: currentPage, section: 0)
            
            collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            
            collectionView.isPagingEnabled = true

        } else {
            print("finish")
            let homeViewController = TabBarViewController()
            homeViewController.modalPresentationStyle = .fullScreen
            present(homeViewController, animated: true)
        }
        
        if currentPage == viewModel.list.count - 1 {
            nextButton.backgroundColor = UIColor(named: "cellColor")
            nextButton.layer.cornerRadius = 27
            nextButton.snp.removeConstraints()
            nextButton.snp.makeConstraints() { make in
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                make.left.equalTo(self.view.snp.left).offset(32)
                make.right.equalTo(self.view.snp.right).offset(-32)
                make.height.equalTo(54)
            }
        }
    }
    
    private func didCurrentPageChange() {
        pageControl.currentPage = currentPage
        if currentPage == viewModel.list.count - 1 {
            nextButton.setTitle("Get Started", for: .normal)
        } else {
            nextButton.setTitle("Next →", for: .normal)
        }
    }

}

// MARK: Collection View

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? OnBoardingCollectionViewCell {
            
            cell.configure(item: viewModel.list[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
