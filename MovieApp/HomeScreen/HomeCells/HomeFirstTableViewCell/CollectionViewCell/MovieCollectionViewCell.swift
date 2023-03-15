//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 15.03.23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.addArrangedSubview(movieTitleLabel)
        stack.addArrangedSubview(movieYearLabel)
        stack.backgroundColor = UIColor(named: "primaryColor")
        
        self.addSubview(stack)
        return stack
    }()
    
    private lazy var movieTitleLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Movie Title"
        label.font = label.customFontBold(16)
        
        return label
    }()
    
    private lazy var movieYearLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "2023"
        label.font = label.customFontLight(12)
        
        return label
    }()
    
    private lazy var movieImg: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "app-icon"))
        self.addSubview(imgView)
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        stackView.snp.makeConstraints() { make in
//            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(30)
        }

        movieImg.snp.makeConstraints() { make in
            make.bottom.equalTo(stackView.snp.top).offset(-8)
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
    }
}
