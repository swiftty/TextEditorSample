//
//  TextEditorImageItem.swift
//  TextEditor
//
//  Created by Kazuya Ueoka on 2022/07/16.
//

import Combine
import UIKit

@MainActor public final class TextEditorImageItem: TextEditorItemRepresentable {
    public init() {
        setUp()
    }

    private var cancellables: Set<AnyCancellable> = .init()
    private var heightConstraint: NSLayoutConstraint?

    private lazy var setUp: () -> Void = {
        $image
            .sink { [weak self] image in
                (self?.contentView as? TextEditorItemImageView)?.image = image
                guard let height = self?.contentView.heightAnchor, let width = self?.contentView.widthAnchor else { return }
                self?.heightConstraint?.isActive = false
                if let image {
                    let aspect = image.size.height / image.size.width
                    self?.heightConstraint = height.constraint(equalTo: width, multiplier: aspect)
                } else {
                    self?.heightConstraint = height.constraint(equalToConstant: 0)
                    self?.heightConstraint?.priority = .defaultHigh
                }
                self?.heightConstraint?.isActive = true
            }
            .store(in: &cancellables)
        return {}
    }()

    public lazy var contentView: UIView = {
        let imageView = TextEditorItemImageView(frame: .null)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.accessibilityIdentifier = #function
        return imageView
    }()

    @Published public var image: UIImage?
}
