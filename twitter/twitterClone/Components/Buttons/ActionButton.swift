//
//  ActionButton.swift
//  twitterClone
//
//  Created by Darío Gallegos on 24/6/22.
//

import SwiftUI

struct ActionButton: View {
    var image: String
    var value: String?
    
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 4) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 14)
                    .foregroundColor( .gray)
                Text(value ?? "")
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .font(.caption)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}
