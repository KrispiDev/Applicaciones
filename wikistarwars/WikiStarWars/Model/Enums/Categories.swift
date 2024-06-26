//
//  Categories.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation
import SwiftUI

enum Categories: CaseIterable {
    case characters, films, planets, species, starships, vehicles

    var name: String {
        switch self {
            case .characters:
                return "Characters"
            case .films:
                return "Films"
            case .planets:
                return "Planets"
            case .species:
                return "Species"
            case .starships:
                return "Starships"
            case .vehicles:
                return "Vehicles"
        }
    }

    var icon: String {
        switch self {
            case .characters:
                return "character"
            case .films:
                return "films"
            case .planets:
                return "planets"
            case .species:
                return "species"
            case .starships:
                return "starships"
            case .vehicles:
                return "vehicles"
        }
    }

    var destination: AnyView {
        switch self {
            case .characters:
                return AnyView(CharactersRouter.view())
            case .films:
                return AnyView(FilmsRouter.view())
            case .planets:
                return AnyView(PlanetsRouter.view())
            case .species:
                return AnyView(SpeciesRouter.view())
            case .starships:
                return AnyView(StarshipsRouter.view())
            case .vehicles:
                return AnyView(VehiclesRouter.view())
        }
    }
}
