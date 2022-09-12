//
//  TextEditorTextItem.swift
//  TextEditor
//
//  Created by Kazuya Ueoka on 2022/07/16.
//

import Combine
import UIKit

@MainActor public class TextEditorTextItem: TextEditorItemRepresentable {
    init(delegate: TextEditorTextViewDelegate?) {
        (contentView as? TextEditorTextView)?.textViewDelegate = delegate
    }

    public lazy var contentView: UIView = {
        let textView = TextEditorTextView()
        textView.font = TextEditorConstant.Font.body
        textView.isScrollEnabled = false
        textView.accessibilityIdentifier = #function
        return textView
    }()
}
