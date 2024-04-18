//
//  GameRouter.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import Foundation

protocol GameRouterProtocol {
    func namePrompt(points: Int, isShown: Bool, onDone: @escaping (String) -> Void) -> NamePromptView
}

final class GameRouter: GameRouterProtocol {
    
    func namePrompt(points: Int, isShown: Bool, onDone: @escaping (String) -> Void) -> NamePromptView {
        return NamePromptBuilder.build(points: points, isShown: isShown) { name in
            onDone(name)
        }
    }
    
}
