//
//  HomeHeaderTableViewCell.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 15.03.23.
//

import UIKit
import SnapKit

class HomeHeaderTableViewCell: UITableViewCell {

    private lazy var titleLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = "Movies"
        label.font = label.customFontBold(27)
        
        self.contentView.addSubview(label)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialize of Table View Cell
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialize of Table View Cell nib/xib file
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews() {
        
        self.contentView.backgroundColor = UIColor(named: "primaryColor")
        
        titleLabel.snp.makeConstraints() { make in
            make.top.equalTo(self.contentView.snp.top).offset(16)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-16)
        }
    }

}
