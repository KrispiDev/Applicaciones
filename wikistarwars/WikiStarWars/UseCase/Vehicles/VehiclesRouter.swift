//
//  VehiclesRouter.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

final class VehiclesRouter {
    static func view() -> VehiclesView {
        let router = VehiclesRouter()
        let viewModel = VehiclesViewModel(router: router)
        let view = VehiclesView(viewModel: viewModel)

        return view
    }
}
