//
//  DetailTitleTableViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 17.03.23.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {

    private lazy var backgroundForStackView: UIView = {
        let view = UIView()
        
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 32
        stackView.addArrangedSubview(yearStackView)
        stackView.addArrangedSubview(timeStackView)
        stackView.addArrangedSubview(genreStackView)
        
        self.backgroundForStackView.addSubview(stackView)
        return stackView
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
        label.font = label.customFontLight(14)
        label.textColor = .darkGray
        
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
        label.font = label.customFontLight(14)
        label.textColor = .darkGray
        
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
        label.font = label.customFontLight(14)
        label.textColor = .darkGray
        
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
        self.backgroundColor = UIColor(named: "primaryColor")
        self.selectionStyle = .none
        
        backgroundForStackView.snp.makeConstraints() { make in
            make.top.equalTo(self.contentView.snp.top).offset(16)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.height.equalTo(50)
        }
        
        detailsStackView.snp.makeConstraints() { make in
            make.centerX.equalTo(self.backgroundForStackView)
            make.centerY.equalTo(self.backgroundForStackView)
        }
        
        genreImgView.snp.makeConstraints() { make in
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        yearImgView.snp.makeConstraints() { make in
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        timeImgView.snp.makeConstraints() { make in
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    func configure(item: Movie?) {
        guard let item = item else { return }
        yearLabel.text = "\(item.year!)"
        timeLabel.text = "\(item.runtime!)"
        genreLabel.text = item.genres![0]
    }

}
