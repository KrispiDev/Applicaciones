//
//  MenuBuilder.swift
//  QuizApp
//
//  Created by KrispiDev on 05/3/23.
//

import Foundation

final class MenuBuilder {
    
    static func build() -> MenuView {
        
        let router: MenuRouter = MenuRouter()
        let viewModel: MenuViewModel = MenuViewModel(router: router)
        let view: MenuView = MenuView(viewModel: viewModel)

        return view
    }
    
}
