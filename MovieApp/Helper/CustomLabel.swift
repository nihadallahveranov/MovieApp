//
//  CustomLabel.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 14.03.23.
//

import UIKit

class CustomLabel: UILabel {
//    
    func customFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size)!
    }
    
    func customFontBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica Bold", size: size)!
    }
    
    func customFontLight(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica Light", size: size)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = customFont(16)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}



