//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 15.03.23.
//

import UIKit
import Hero
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    private lazy var movieTitleLabel: CustomLabel = {
        let label = CustomLabel()
        
        label.numberOfLines = 0
        
        self.addSubview(label)
        return label
    }()
    
    private lazy var movieImg: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "app-icon"))
        imgView.layer.cornerRadius = 18
        imgView.clipsToBounds = true
        imgView.hero.isEnabled = true
        imgView.hero.id = "image"
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
        
        movieImg.snp.makeConstraints() { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom).offset(-48)
        }
        movieTitleLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.movieImg.snp.bottom)
            make.left.equalTo(self.snp.left).offset(4)
            make.right.equalTo(self.snp.right).offset(-4)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func configure(item: Movie?) {
        guard let item = item else { return }
        movieTitleLabel.attributedText = getAttributedString(firstString: item.title!, secondString: " (\(item.year!))")
        let url = URL(string: item.largeCoverImage!)
        movieImg.kf.setImage(with: url)
    }
    
    func getAttributedString(firstString: String, secondString: String) -> NSMutableAttributedString {
        let label = CustomLabel()
        let myFirstAttribute = [NSAttributedString.Key.font: label.customFontBold(16)]
        let firstString = NSMutableAttributedString(string: firstString, attributes: myFirstAttribute)
        
        let mySecondAttribute = [NSAttributedString.Key.font: label.customFontLight(12)]
        let secondString = NSMutableAttributedString(string: secondString, attributes: mySecondAttribute)
        
        let combinedString = NSMutableAttributedString()
        combinedString.append(firstString)
        combinedString.append(secondString)
        
        return combinedString
    }
}
