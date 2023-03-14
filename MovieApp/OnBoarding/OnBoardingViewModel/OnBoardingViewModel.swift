//
//  OnBoardingViewModel.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 14.03.23.
//

import Foundation

class OnBoardingViewModel {
    var list: [OnBoardingModel] = []
    
    func getItems() {
        
        let items: [OnBoardingModel] = [
            OnBoardingModel(title: "OFFLINE",
                            description: "Watch to your favorite film anywhere without an internet connection",
                            image: OnBoardingLottieAnimations.ONBOARDING_1),
            OnBoardingModel(title: "FIND MOVIE",
                            description: "Watch and find movies that bring your mode back",
                            image: OnBoardingLottieAnimations.ONBOARDING_2),
            OnBoardingModel(title: "INVITE FRIENDS",
                            description: "Creat personal movie night space or accept your friends invitation!",
                            image: OnBoardingLottieAnimations.ONBOARDING_3)
        ]
        
        self.list = items
    }
}
