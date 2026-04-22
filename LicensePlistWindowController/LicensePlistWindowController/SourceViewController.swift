//
//  SourceViewController.swift
//  LicensePlistWindowController
//
//  Created by nya on 6/13/1 R.
//  Copyright © 1 Reiwa cathand.org. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController {

    private let usesProgrammaticView: Bool
    private let cellIdentifier = NSUserInterfaceItemIdentifier("outlineViewCell")

    @IBOutlet weak var outlineView: NSOutlineView!

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
            let frame = NSRect(x: 0, y: 0, width: 228, height: 361)
            let scrollView = NSScrollView(frame: frame)
            scrollView.autohidesScrollers = true
            scrollView.hasVerticalScroller = true

            let outlineView = NSOutlineView(frame: frame)
            let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("title"))
            column.resizingMask = .autoresizingMask
            outlineView.addTableColumn(column)
            outlineView.outlineTableColumn = column
            outlineView.headerView = nil
            outlineView.columnAutoresizingStyle = .firstColumnOnlyAutoresizingStyle
            outlineView.selectionHighlightStyle = .sourceList
            outlineView.delegate = self
            outlineView.dataSource = self

            scrollView.documentView = outlineView

            self.outlineView = outlineView
            view = scrollView
            return
        }

        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        outlineView.delegate = self
        outlineView.dataSource = self
        outlineView.reloadData()
    }

    var textViewController: TextViewController? {
        return (parent as? NSSplitViewController)?.splitViewItems.last?.viewController as? TextViewController
    }

    var items: [LicenseItem] = [] {
        didSet {
            guard isViewLoaded else {
                return
            }
            outlineView.reloadData()
            if outlineView.selectedRow >= items.count {
                outlineView.deselectAll(nil)
                textViewController?.item = nil
            }
        }
    }

    private func makeCellView() -> NSTableCellView {
        let cell = NSTableCellView(frame: NSRect(x: 0, y: 0, width: 0, height: 17))
        cell.identifier = cellIdentifier

        let textField = NSTextField(labelWithString: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(textField)
        cell.textField = textField

        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 5),
            textField.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -5),
            textField.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
        ])

        return cell
    }
}

extension SourceViewController: NSOutlineViewDataSource, NSOutlineViewDelegate {

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return items.count
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return items[index]
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }

    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        return false
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let text: String
        switch item {
        case let item as LicenseItem:
            text = item.title
        default:
            text = ""
        }

        let cell = (outlineView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView) ?? makeCellView()
        cell.textField?.stringValue = text

        return cell
    }

    func outlineViewSelectionDidChange(_ notification: Notification) {
        let idx = outlineView.selectedRow
        guard idx >= 0, idx < items.count else {
            textViewController?.item = nil
            return
        }
        textViewController?.item = items[idx]
    }
}
