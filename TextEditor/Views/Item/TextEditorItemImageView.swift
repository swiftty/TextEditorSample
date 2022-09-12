//
//  TextEditorItemImageView.swift
//  TextEditor
//
//  Created by Kazuya Ueoka on 2022/07/17.
//

import Combine
import UIKit

open class TextEditorItemImageView: UIImageView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUp()
    }

    private lazy var setUp: () -> Void = {
        isUserInteractionEnabled = false
        backgroundColor = TextEditorConstant.Color.background
        return {}
    }()
}
