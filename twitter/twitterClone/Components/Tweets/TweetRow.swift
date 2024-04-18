//
//  TweetCard.swift
//  twitterClone
//
//  Created by Darío Gallegos on 23/6/22.
//

import SwiftUI

struct TweetRow: View {
    var tweet: Tweet
    var maxHeightTweet: CGFloat = .infinity

    
    private let sizeMainImage: CGFloat = 55
    private let sizeSecondaryImage: CGFloat = 37
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                VStack(alignment:.center, spacing: 3) {
                    CircleImage(name: tweet.imageProfile, size: CGSize(width: sizeMainImage, height: sizeMainImage))
                        .padding(.trailing, 4)
                    if (tweet.showTheard) {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.gray.opacity(0.5))
                            .frame(width: 2)
                            .frame(maxHeight: maxHeightTweet)
                        CircleImage(name: tweet.imageProfile, size: CGSize(width: sizeSecondaryImage, height: sizeSecondaryImage))
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    
                    TitleTweet(name: tweet.username, nick: tweet.nickname, date: tweet.date)
                    RichText(tweet.message)
                        .padding(.bottom, 4)
                        .layoutPriority(1)
                    MediaTweet()
                    ActionTweetBar()
                    if(tweet.showTheard) {
                        ShowTheardTweet()
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .font(.callout)
            }
            .padding(.top)
            .padding(.horizontal, 24)
            
            Divider()
        }
    }
    
    @ViewBuilder
    func MediaTweet() -> some View {
        switch tweet.tweetType {
        case .text:
            EmptyView()
        case .image:
            ImagesTweet(filenames: tweet.imagesFile)
        case .video:
            VideoTweet(filename: tweet.videoFile)
        default:
            EmptyView()
        }
    }
}



struct TweetRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TweetRow(tweet: Tweet(username: "dariogallegos", nickname: "@gallegos_dario", date: "3h", tweetType: .text, showTheard: true, message: "El show *#Payaso* de *@franco_esca me dejo* llorando durante dos. Super recomendado!!!", imagesFile: [], videoFile: ""))
        }
    }
}


