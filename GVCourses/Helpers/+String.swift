//
//  StringExtensions.swift
//  GVCourses
//
//  Created by Minh Tran on 05/10/2023.
//

import Foundation

extension String {
    func toMarkdown() -> AttributedString {
        do {
            return try AttributedString(markdown: self, options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace))
        } catch {
            print("Error parsing Markdown for string \(self): \(error)")
            return AttributedString(self)
        }
    }
    
    /*
     Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
     - Parameter length: Desired maximum lengths of a string
     - Parameter trailing: A 'String' that will be appended after the truncation.
     
     - Returns: 'String' object.
     */
    func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
}

extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        return dateFormatter.string(from: Date())
    }
}
