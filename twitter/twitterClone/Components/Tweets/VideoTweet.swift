//
//  VideoTweet.swift
//  twitterClone
//
//  Created by Darío Gallegos on 27/6/22.
//

import SwiftUI

struct VideoTweet: View {
    @ObservedObject var model: PlayerViewModel
    private let paddingHorizontal: CGFloat = 90

    init(filename: String) {
        model = PlayerViewModel(fileName: filename)
    }
    
    var body: some View {
        VStack {
            PlayerContainerView(player: model.player, gravity: .aspectFill)
                .frame(height: getScreenSize().height / 2)
                .frame(width: getScreenSize().width - paddingHorizontal)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                    )
                .padding(.vertical, 4)
                .onTapGesture {
                    self.model.isPlaying.toggle()
                }
                .overlay {
                    if (!model.isPlaying) {
                        Image("play")
                            .onTapGesture {
                                self.model.isPlaying.toggle()
                            }
                    }
                }
        }
    }
}

struct VideoTweet_Previews: PreviewProvider {
    static var previews: some View {
        VideoTweet(filename: "seal")
    }
}
