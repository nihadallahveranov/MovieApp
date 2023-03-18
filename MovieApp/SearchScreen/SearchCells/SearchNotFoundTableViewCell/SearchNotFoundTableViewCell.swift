//
//  SearchNotFoundTableViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 17.03.23.
//

import UIKit
import Lottie

class SearchNotFoundTableViewCell: UITableViewCell {
    
    private lazy var backgroundSearchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "primaryColor")
        
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var searchNotFoundLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "we are sorry, we can not find the movie :("
        label.font = label.customFontBold(24)
        label.numberOfLines = 0
        
        self.contentView.addSubview(label)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    func configure(height: CGFloat){
        backgroundSearchView.snp.makeConstraints() { make in
            make.height.equalTo(height - 150)
            make.top.equalTo(self.contentView.snp.top)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.bottom.equalTo(self.contentView.snp.bottom)
        }
        
        var animationView: LottieAnimationView?
        animationView = .init(name: "search-not-found")
        animationView!.frame = backgroundSearchView.bounds
        animationView!.contentMode = .scaleAspectFit
        
        backgroundSearchView.addSubview(animationView!)
        
        animationView!.snp.makeConstraints() { make in
            make.top.equalTo(backgroundSearchView.snp.top)
            make.left.equalTo(backgroundSearchView.snp.left)
            make.right.equalTo(backgroundSearchView.snp.right)
            make.bottom.equalTo(backgroundSearchView.snp.bottom).offset(-150)
        }
        
        searchNotFoundLabel.snp.makeConstraints() { make in
            make.top.equalTo(animationView!.snp.bottom).offset(-48)
            make.left.equalTo(self.contentView.snp.left).offset(32)
            make.right.equalTo(self.contentView.snp.right).offset(-32)
            make.centerX.equalTo(self.contentView)
        }
        
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        animationView!.play()
    }

}
