//
//  UI.swift
//  MemoryGame
//
//  Created by KrispiDev on 20/5/23.
//

import SwiftUI

extension CGFloat {
    
    // Size
    
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    
}

extension String {
    
    func key() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
    
}
