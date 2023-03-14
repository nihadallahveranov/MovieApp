//
//  OnBoardingModel.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 14.03.23.
//

import Foundation

enum OnBoardingLottieAnimations {
    static let ONBOARDING_1 = "onboarding-1"
    static let ONBOARDING_2 = "onboarding-2"
    static let ONBOARDING_3 = "onboarding-3"
}

struct OnBoardingModel: Codable {
    let title: String
    let description: String
    let image: String
}
