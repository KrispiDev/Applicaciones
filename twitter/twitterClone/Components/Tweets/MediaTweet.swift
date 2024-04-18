//
//  ImagesTweet.swift
//  twitterClone
//
//  Created by Darío Gallegos on 24/6/22.
//

import SwiftUI

struct ImagesTweet: View {
    private let paddingHorizontal: CGFloat = 90
    private let spacingGrid: CGFloat = 4
    private let heightContent: CGFloat = 180
    var filenames: [String]

    var body: some View {
        if !filenames.isEmpty {
            if filenames.count > 1 {
                GridContent(files: filenames)
                    .frame(height: heightContent)
                    .frame(width: getScreenSize().width - paddingHorizontal)
                    .cornerRadius(12)
                    .padding(.vertical, 4)
            } else {
                
                Image(filenames[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: getScreenSize().height / 2)
                    .frame(width: getScreenSize().width - paddingHorizontal)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                        )
                    .padding(.vertical, 4)

            }
        } else {
            EmptyView()
        }
    }
    
    
    @ViewBuilder
    func GridContent(files: [String]) -> some View {
        switch files.count {
        case 1:
            HStack(spacing: spacingGrid) {
                VStack(spacing: spacingGrid) {
                    ImageClipped(image: files[0])
                }
            }
        case 2:
            HStack(spacing: spacingGrid) {
                VStack(spacing: spacingGrid) {
                    ImageClipped(image: files[0])
                }

                VStack(spacing: spacingGrid) {
                    ImageClipped(image: files[1])
                }
            }
        case 3:
            HStack(spacing: spacingGrid) {
                VStack(spacing: spacingGrid){
                    ImageClipped(image: files[0])
                }
                
                VStack(spacing: spacingGrid) {
                    ImageClipped(image: files[1])
                    ImageClipped(image: files[2])
                }
            }
        default:
            HStack(spacing: spacingGrid) {
                VStack(spacing: spacingGrid) {
                    ImageClipped(image: files[0])
                    ImageClipped(image: files[1])
                }
                
                VStack(spacing: spacingGrid) {
                    ImageClipped(image: files[2])
                    ImageClipped(image: files[3])
                }
            }
        }
    }
    
    @ViewBuilder
    func ImageClipped(image: String) -> some View {
        Rectangle()
            .overlay {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }.clipped()
    }
}


struct MediaTweetProvider_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ImagesTweet(filenames: ["tweet-image-1"])
        }
    }
}
