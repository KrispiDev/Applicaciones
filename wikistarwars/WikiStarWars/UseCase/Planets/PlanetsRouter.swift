//
//  PlanetsRouter.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

final class PlanetsRouter {
    static func view() -> PlanetsView {
        let router = PlanetsRouter()
        let viewModel = PlanetsViewModel(router: router)
        let view = PlanetsView(viewModel: viewModel)

        return view
    }
}
