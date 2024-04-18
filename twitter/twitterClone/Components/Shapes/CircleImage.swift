//
//  CircleImage.swift
//  twitterClone
//
//  Created by Darío Gallegos on 24/6/22.
//

import SwiftUI

struct CircleImage: View {
    var name: String = ""
    var size: CGSize = CGSize(width: 40, height: 40)
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: size.height)
            .clipShape(Circle())
    }
}
