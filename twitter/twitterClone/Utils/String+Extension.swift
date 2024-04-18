//
//  String+Extension.swift
//  twitterClone
//
//  Created by Darío Gallegos on 23/6/22.
//

import Foundation

extension String {

    func parseRichTextElements() -> [RichText.Element] {
        let regex = try! NSRegularExpression(pattern: "\\*{1}(.*?)\\*{1}")
        let range = NSRange(location: 0, length: count)

        // Find all the ranges that match the regex *CONTENT*.
        let matches: [NSTextCheckingResult] = regex.matches(in: self, options: [], range: range)
        let matchingRanges = matches.compactMap { Range<Int>($0.range) }

        var elements: [RichText.Element] = []

        // Add the first range which might be the complete content if no match was found.
        // This is the range up until the lowerbound of the first match.
        let firstRange = 0..<(matchingRanges.count == 0 ? count : matchingRanges[0].lowerBound)

        self[firstRange].components(separatedBy: " ").forEach { (word) in
            guard !word.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
            elements.append(RichText.Element(content: String(word), isLink: false))
        }

        // Create elements for the remaining words and ranges.
        for (index, matchingRange) in matchingRanges.enumerated() {
            let isLast = matchingRange == matchingRanges.last

            // Add an element for the matching range which should be bold.
            let matchContent = self[matchingRange]
            elements.append(RichText.Element(content: matchContent, isLink: true))

            // Add an element for the text in-between the current match and the next match.
            let endLocation = isLast ? count : matchingRanges[index + 1].lowerBound
            let range = matchingRange.upperBound..<endLocation
            self[range].components(separatedBy: " ").forEach { (word) in
                guard !word.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                elements.append(RichText.Element(content: String(word), isLink: false))
            }
        }

        return elements
    }

    // - Returns: A string subscript based on the given range.
    subscript(range: Range<Int>) -> String {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
