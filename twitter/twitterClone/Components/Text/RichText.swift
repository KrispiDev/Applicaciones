//
//  RichText.swift
//  twitterClone
//
//  Created by Darío Gallegos on 23/6/22.
//

import SwiftUI

struct RichText: View {

    struct Element: Identifiable {
        let id = UUID()
        let content: String
        let isLink: Bool

        init(content: String, isLink: Bool) {
            var content = content.trimmingCharacters(in: .whitespacesAndNewlines)

            if isLink {
                content = content.replacingOccurrences(of: "*", with: "")
            }

            self.content = content
            self.isLink = isLink
        }
    }

    let elements: [Element]

    init(_ content: String) {
        elements = content.parseRichTextElements()
    }

    var body: some View {
        var content = text(for: elements.first!)
        elements.dropFirst().forEach { (element) in
            content = content + self.text(for: element)
        }
        return content
    }
    
    private func text(for element: Element) -> Text {
        let postfix = shouldAddSpace(for: element) ? " " : ""
        if element.isLink {
            return Text(element.content + postfix)
                .foregroundColor(.twitterColor)
        } else {
            return Text(element.content + postfix)
        }
    }

    private func shouldAddSpace(for element: Element) -> Bool {
        return element.id != elements.last?.id
    }
    
}

struct RichText_Previews: PreviewProvider {
    static var previews: some View {
        RichText("Hola a *todos*")
    }
}
