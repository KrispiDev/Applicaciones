//
//  Fonts.swift
//  ConnectFour
//
//  Created by KrispiDev on 15/01/23.
//

import UIKit
import Foundation

enum Fonts {
    // MARK: - Define some global properties here
}

extension Fonts {
    enum FontWeight: String {
        case regular = "Regular"
        case semibold = "Semibold"
    }
    
    static func averta(weight: FontWeight, size: CGFloat) -> UIFont {
        guard let baseFont = UIFont(name: "AvertaPE-\(weight.rawValue)", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        
        return baseFont
    }
}
