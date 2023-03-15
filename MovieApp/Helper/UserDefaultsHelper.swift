//
//  UserDefaultsHelper.swift
//  MovieApp
//
//  Created by Nihad Allahveranov on 13.03.23.
//

import Foundation

enum UserDefaultsKeys {
    static let ONBOARDING_COMPLETED = "onboardingCompleted"
}

class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    
    func saveObject<T: Codable>(_ object: T?, key: String) {
        if let object = object {
            if let data = try? JSONEncoder().encode(object) {
                UserDefaults.standard.set(data, forKey: key)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    func getObject<T: Codable>(class: T?, key: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: key),
           let object = try? JSONDecoder().decode(T.self, from: data) {
            return object
        } else {
            return nil
        }
    }
    
    func getOnboardingCompleted() -> Bool {
        let status = UserDefaults.standard.bool(forKey: UserDefaultsKeys.ONBOARDING_COMPLETED)
        
        return status
    }
    
    func setOnboardingCompleted(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: UserDefaultsKeys.ONBOARDING_COMPLETED)
    }
}
