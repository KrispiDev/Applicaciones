//
//  ScoreStorage.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import Foundation

protocol ScoreStorage: AnyObject {
    var youScore: Int { get }
    var otherScore: Int { get }
    
    /// Increase the player score by the given amount
    func increaseYouScore(by amount: Int)
    
    /// Increase the othe rplayer score by the given amount
    func increaseOtherScore(by amount: Int)
    
    /// Removes the player score
    func clearYouScore()
    
    /// Remove the other player score
    func clearOtherStore()
    
    /// Removes all stored scores
    func clearScores()
}

extension ScoreStorage {
    func clearScores() {
        clearYouScore()
        clearOtherStore()
    }
}
