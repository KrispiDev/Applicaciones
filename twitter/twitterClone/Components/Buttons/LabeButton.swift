//
//  LabeButton.swift
//  twitterClone
//
//  Created by Darío Gallegos on 21/6/22.
//

import SwiftUI

struct LabeButton: View {
    var text: String
    var number: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Label {
                Text(text)
                    .fontWeight(.regular)
                    .opacity(0.7)
            } icon: {
                Text(number)
                    .fontWeight(.bold)
            }
        }
        .foregroundColor(.primary)
    }
}
