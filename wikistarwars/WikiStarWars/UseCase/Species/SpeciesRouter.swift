//
//  SpeciesRouter.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

final class SpeciesRouter {
    static func view() -> SpeciesView {
        let router = SpeciesRouter()
        let viewModel = SpeciesViewModel(router: router)
        let view = SpeciesView(viewModel: viewModel)

        return view
    }
}
