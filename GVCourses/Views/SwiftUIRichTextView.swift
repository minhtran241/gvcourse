//
//  SwiftUIRichTextView.swift
//  GVCourses
//
//  Created by Minh Tran on 05/10/2023.
//

import SwiftUI
import Contentful
import RichTextRenderer

public struct SwiftUIRichTextView: UIViewControllerRepresentable {
    private let richTextViewController: RichTextViewController
    private var richTextDocument: RichTextDocument?
    
    public init(
        richTextViewController: RichTextViewController,
        richTextDocument: RichTextDocument
    ) {
        self.richTextViewController = richTextViewController
        self.richTextDocument = richTextDocument
    }
    
    public func makeUIViewController(context _: Context) -> RichTextViewController {
        return richTextViewController
    }
    
    public func updateUIViewController(_ viewController: RichTextViewController, context _: Context) {
        viewController.richTextDocument = richTextDocument
    }
}
