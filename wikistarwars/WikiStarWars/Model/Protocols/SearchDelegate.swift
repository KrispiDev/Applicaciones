//
//  Searchable.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import Foundation

protocol SearchDelegate {
    func search(query: String)
    var placeHolder: String { get }
}
