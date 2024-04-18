//
//  ActionTweetBar.swift
//  twitterClone
//
//  Created by Darío Gallegos on 24/6/22.
//

import SwiftUI

struct ActionTweetBar: View {
    var body: some View {
        HStack {
            ActionButton(image: "comment", value: "22")
            ActionButton(image: "retweet", value: "164")
            ActionButton(image: "heart", value: "2573")
            ActionButton(image: "share", value: "")
        }
        .padding(.vertical, 8)
    }
}

struct ActionTweetBar_Previews: PreviewProvider {
    static var previews: some View {
        ActionTweetBar()
            .previewLayout(.sizeThatFits)
    }
}
