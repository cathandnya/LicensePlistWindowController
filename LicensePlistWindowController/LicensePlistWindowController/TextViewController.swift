//
//  TextViewController.swift
//  LicensePlistWindowController
//
//  Created by nya on 6/13/1 R.
//  Copyright © 1 Reiwa cathand.org. All rights reserved.
//

import Cocoa

class TextViewController: NSViewController {

    private let usesProgrammaticView: Bool

    @IBOutlet var textView: NSTextView!

    init(programmatic: Void = ()) {
        usesProgrammaticView = true
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        usesProgrammaticView = false
        super.init(coder: coder)
    }

    override func loadView() {
        if usesProgrammaticView {
            let frame = NSRect(x: 0, y: 0, width: 450, height: 300)
            let scrollView = NSScrollView(frame: frame)
            scrollView.autohidesScrollers = true
            scrollView.hasVerticalScroller = true

            let textView = NSTextView(frame: frame)
            textView.isEditable = false
            textView.isSelectable = true
            textView.isHorizontallyResizable = false
            textView.isVerticallyResizable = true
            textView.autoresizingMask = [.width]
            textView.textContainer?.containerSize = NSSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude)
            textView.textContainer?.widthTracksTextView = true
            textView.textContainerInset = NSSize(width: 12, height: 12)

            scrollView.documentView = textView

            self.textView = textView
            view = scrollView
            return
        }

        super.loadView()
    }

    var item: LicenseItem? {
        didSet {
            updateText()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
    }

    private func updateText() {
        guard isViewLoaded else {
            return
        }
        textView.string = item?.text ?? ""
    }
}
