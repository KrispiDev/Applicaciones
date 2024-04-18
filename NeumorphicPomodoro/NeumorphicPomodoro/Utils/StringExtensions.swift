//
//  StringExtensions.swift
//  NeumorphicPomodoro
//
//  Created by KrispiDev on 12/4/23.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
