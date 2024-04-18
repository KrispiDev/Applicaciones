//
//  ShowTheardTweet.swift
//  twitterClone
//
//  Created by Darío Gallegos on 24/6/22.
//

import SwiftUI

struct ShowTheardTweet: View {
    var body: some View {
        Text("Mostrar este hilo")
            .foregroundColor(.twitterColor)
            .lineLimit(1)
            .padding(.top, 12)
            .padding(.bottom, 8)
    }
}
