//
//  DetailHeaderTableViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 17.03.23.
//

import UIKit
import SnapKit

class DetailHeaderTableViewCell: UITableViewCell {
    
    private lazy var backgroundImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "app-icon"))
        
        self.contentView.addSubview(imgView)
        return imgView
    }()
    
    private lazy var movieImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "app-icon"))
        imgView.layer.cornerRadius = 18
        imgView.clipsToBounds = true
        
        self.contentView.addSubview(imgView)
        return imgView
    }()
    
    private lazy var movieTitleLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Spiderman No Way"
        label.font = label.customFontBold(21)
        label.numberOfLines = 0
        label.frame.origin.y = 0
        label.contentMode = .top
        
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var backgroundForStackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "primaryColor")
        view.layer.cornerRadius = 9
        
        self.backgroundImgView.addSubview(view)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.addArrangedSubview(imdbScoreImgView)
        stack.addArrangedSubview(imdbScoreLabel)
        
        self.backgroundForStackView.addSubview(stack)
        return stack
    }()
    
    private lazy var imdbScoreImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "star"))
        imgView.tintColor = .yellow
        
        return imgView
    }()
    
    private lazy var imdbScoreLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "9.5"
        label.textColor = .yellow
        label.font = label.customFontBold(18)
        
        return label
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
        self.contentView.backgroundColor = UIColor(named: "primaryColor")
        self.selectionStyle = .none
        
        backgroundImgView.snp.makeConstraints() { make in
            make.top.equalTo(self.contentView.snp.top)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.height.equalTo(216)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-96)
        }
        
        movieImgView.snp.makeConstraints() { make in
            make.top.equalTo(self.backgroundImgView.snp.bottom).offset(-96)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.height.equalTo(192)
            make.width.equalTo(144)
        }
        
        movieTitleLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.backgroundImgView.snp.bottom).offset(8)
            make.left.equalTo(self.movieImgView.snp.right).offset(8)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        backgroundForStackView.snp.makeConstraints() { make in
            make.right.equalTo(self.backgroundImgView.snp.right).offset(-16)
            make.bottom.equalTo(self.backgroundImgView.snp.bottom).offset(-16)
        }
        
        stackView.snp.makeConstraints() { make in
            make.top.equalTo(self.backgroundForStackView.snp.top).offset(4)
            make.left.equalTo(self.backgroundForStackView.snp.left).offset(4)
            make.right.equalTo(self.backgroundForStackView.snp.right).offset(-4)
            make.bottom.equalTo(self.backgroundForStackView.snp.bottom).offset(-4)
        }
        
    }
    
    func configure(item: Movie?) {
        guard let item = item else { return }
        
        let urlBackgroundImg = URL(string: item.backgroundImageOriginal!)
        backgroundImgView.kf.setImage(with: urlBackgroundImg)
        let urlMovieImg = URL(string: item.largeCoverImage!)
        movieImgView.kf.setImage(with: urlMovieImg)
        movieTitleLabel.text = item.title!
        imdbScoreLabel.text = "\(item.rating!)"
    }
}
