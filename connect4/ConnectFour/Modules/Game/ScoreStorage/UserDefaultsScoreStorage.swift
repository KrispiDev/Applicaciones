//
//  UserDefaultsManager.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import Foundation

class UserDefaultsScoreStorage: ScoreStorage {
    
    private let youScoreKey: String = "Tu_Puntuación"
    private let otherScoreKey: String = "Puntuación_Rival"
    
    var youScore: Int {
        get {
            return UserDefaults.standard.integer(forKey: youScoreKey)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: youScoreKey)
        }
    }
    
    var otherScore: Int {
        get {
            return UserDefaults.standard.integer(forKey: otherScoreKey)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: otherScoreKey)
        }
    }
}

extension UserDefaultsScoreStorage {
    func increaseYouScore(by amount: Int) {
        youScore += amount
    }
    
    func increaseOtherScore(by amount: Int) {
        otherScore += amount
    }
    
    func clearYouScore() {
        youScore = 0
    }
    
    func clearOtherStore() {
        otherScore = 0
    }
}
