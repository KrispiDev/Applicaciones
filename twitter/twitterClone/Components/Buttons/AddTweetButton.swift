//
//  AddTweetButton.swift
//  twitterClone
//
//  Created by Darío Gallegos on 27/6/22.
//

import SwiftUI

struct AddTweetButton: View {
    var body: some View {
        VStack() {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 54, height: 54)
                    .background(Color.twitterColor)
                    .clipShape(Circle())
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
            }
        }
    }
}

