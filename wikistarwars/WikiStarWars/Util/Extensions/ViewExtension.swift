//
//  ViewExtension.swift
//  WikiStarWars
//
//  Created by KrispiDev on 26/02/23.
//

import UIKit
import SwiftUI

/// Extension to apply dismiss keyboard
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


extension View {
    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text))
    }
}
