//
//  OnBoardingCollectionViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 13.03.23.
//

import UIKit
import SnapKit
import Lottie

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    private lazy var backgroundCellView: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(named: "primaryColor")
        view.backgroundColor = .white
//        view.frame = self.bounds
        view.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height - 150)
        
        self.addSubview(view)
        return view
    }()
    
    private lazy var descriptionLabel: CustomLabel = {
        let label = CustomLabel()
        label.numberOfLines = 0
        label.text = "Description label"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)

        self.addSubview(label)
        return label
    }()

    private lazy var titleLabel: CustomLabel = {
        let label = CustomLabel()
        label.numberOfLines = 0
        label.text = "Title for Movie App"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)

        self.addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        descriptionLabel.snp.makeConstraints() { make in
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(32)
            make.right.equalTo(self.snp.right).offset(-32)
            make.centerX.equalTo(self)
        }
        titleLabel.snp.makeConstraints() { make in
            make.bottom.equalTo(self.descriptionLabel.snp.top).offset(-8)
            make.left.equalTo(self.snp.left).offset(32)
            make.right.equalTo(self.snp.right).offset(-32)
            make.centerX.equalTo(self)
        }
        backgroundCellView.snp.makeConstraints() { make in
            make.top.equalTo(self.snp.top).offset(16)
//            make.left.equalTo(self.snp.left).offset(16)
//            make.right.equalTo(self.snp.right).offset(-16)
            make.bottom.equalTo(titleLabel.snp.top).offset(-16)
        }
        
    }
    
    // MARK: The animation is not added because the configure function is called before the view is created. for this, animation doesn't work correctly
    
    func configure(item: OnBoardingModel) {
        
        self.titleLabel.text = item.title
        self.descriptionLabel.text = item.description
        
        var animationView: LottieAnimationView?
        animationView = .init(name: item.image)
        animationView!.frame = backgroundCellView.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        
        animationView!.animationSpeed = 0.5
        backgroundCellView.addSubview(animationView!)
        animationView!.play()
    }
}
