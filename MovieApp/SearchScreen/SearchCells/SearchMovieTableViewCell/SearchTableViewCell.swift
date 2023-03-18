//
//  SearchTableViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 17.03.23.
//

import UIKit
import Kingfisher

class SearchTableViewCell: UITableViewCell {
    
    private lazy var movieImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "app-icon"))
        imgView.backgroundColor = .white
        imgView.layer.cornerRadius = 18
        imgView.clipsToBounds = true
        
        self.contentView.addSubview(imgView)
        return imgView
    }()
    
    private lazy var movieTitleLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "SpidermanSpidermanSpidermanSpidermanSpiderman"
        label.font = label.customFontBold(18)
        label.numberOfLines = 0
        
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var backgroundForStackView: UIView = {
        let view = UIView()
        
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.addArrangedSubview(ratingStackView)
        stackView.addArrangedSubview(genreStackView)
        stackView.addArrangedSubview(yearStackView)
        stackView.addArrangedSubview(timeStackView)
        
        self.backgroundForStackView.addSubview(stackView)
        return stackView
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.addArrangedSubview(ratingImgView)
        stackView.addArrangedSubview(ratingLabel)
        
        return stackView
    }()
    
    private lazy var ratingImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "star"))
        imgView.tintColor = .yellow
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }()
    
    private lazy var ratingLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "9.5"
        label.font = label.customFontBold(14)
        label.textColor = .yellow
        
        return label
    }()
    
    private lazy var genreStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.addArrangedSubview(genreImgView)
        stackView.addArrangedSubview(genreLabel)
        
        return stackView
    }()
    
    private lazy var genreImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "poweroutlet.type.a"))
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = UIColor(named: "secondaryColor")
        
        return imgView
    }()
    
    private lazy var genreLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Action"
        label.font = label.customFontBold(14)
        label.textColor = UIColor(named: "secondaryColor")
        
        return label
    }()
    
    private lazy var yearStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.addArrangedSubview(yearImgView)
        stackView.addArrangedSubview(yearLabel)
        
        return stackView
    }()
    
    private lazy var yearImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "calendar"))
        imgView.contentMode = .scaleAspectFit
        imgView.image = imgView.image?.withRenderingMode(.alwaysTemplate)
        imgView.tintColor = UIColor(named: "secondaryColor")
        
        return imgView
    }()
    
    private lazy var yearLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "2019"
        label.font = label.customFontBold(14)
        label.textColor = UIColor(named: "secondaryColor")
        
        return label
    }()
    
    private lazy var timeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.addArrangedSubview(timeImgView)
        stackView.addArrangedSubview(timeLabel)
        
        return stackView
    }()
    
    private lazy var timeImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "clock"))
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = UIColor(named: "secondaryColor")
        
        return imgView
    }()
    
    private lazy var timeLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "139 minutes"
        label.font = label.customFontBold(14)
        label.textColor = UIColor(named: "secondaryColor")
        
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
        
        movieImgView.snp.makeConstraints() { make in
            make.top.equalTo(self.contentView.snp.top).offset(16)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.height.equalTo(192)
            make.width.equalTo(128)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        movieTitleLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.movieImgView.snp.top).offset(4)
            make.left.equalTo(self.movieImgView.snp.right).offset(8)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
        }
        
        backgroundForStackView.snp.makeConstraints() { make in
            make.top.equalTo(self.movieTitleLabel.snp.bottom).offset(16)
            make.left.equalTo(self.movieImgView.snp.right).offset(8)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-16)
        }
        
        mainStackView.snp.makeConstraints() { make in
//            make.top.equalTo(self.backgroundForStackView.snp.top)
            make.left.equalTo(self.backgroundForStackView.snp.left)
//            make.right.equalTo(self.backgroundForStackView.snp.right)
            make.bottom.equalTo(self.backgroundForStackView.snp.bottom)
        }
        
        ratingImgView.snp.makeConstraints() { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        genreImgView.snp.makeConstraints() { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        yearImgView.snp.makeConstraints() { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        timeImgView.snp.makeConstraints() { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
    }
    
    func configure(item: MovieSearch?) {
        guard let item = item else { return }
        
        let url = URL(string: item.image!)
        movieImgView.kf.setImage(with: url)
        movieTitleLabel.text = item.title!
        ratingLabel.text = item.imDbRating ?? "Unknown"
        if let genre = item.genreList?[0].key {
            genreLabel.text = genre
        } else {
            genreLabel.text = "Unknown"
        }
        yearLabel.text = item.description ?? "Unknown"
        timeLabel.text = item.runtimeStr ?? "Unknown"
    }

}
