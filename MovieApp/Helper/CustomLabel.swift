//
//  CustomLabel.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 14.03.23.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Arial", size: 16)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}



