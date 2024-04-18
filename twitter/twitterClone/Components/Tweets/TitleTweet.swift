//
//  TitleTweet.swift
//  twitterClone
//
//  Created by Darío Gallegos on 24/6/22.
//

import SwiftUI

struct TitleTweet: View {
    var name: String = ""
    var nick: String = ""
    var date: String = ""
    
    var body: some View {
        HStack {
            Text(name)
                .bold()
            Text(nick)
                .foregroundColor(.gray)
                .lineLimit(1)
            Text(date)
                .foregroundColor(.gray)
        }
    }
}
