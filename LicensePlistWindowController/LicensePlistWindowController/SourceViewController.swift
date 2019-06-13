//
//  SourceViewController.swift
//  LicensePlistWindowController
//
//  Created by nya on 6/13/1 R.
//  Copyright © 1 Reiwa cathand.org. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController {

    @IBOutlet weak var outlineView: NSOutlineView!

    var textViewController: TextViewController? {
        return (parent as? NSSplitViewController)?.splitViewItems.last?.viewController as? TextViewController
    }
    
    var items: [LicenseItem] = [] {
        didSet {
            outlineView.reloadData()
        }
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
    
    // Set the text for each row
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var text = ""
        
        // Recall that `item` is the row identiffier
        switch (item) {
        case let item as LicenseItem:
            text = item.title
        default:
            text = ""
        }
        
        let cellIdentifier = NSUserInterfaceItemIdentifier("outlineViewCell")
        let cell = outlineView.makeView(withIdentifier: cellIdentifier, owner: self) as! NSTableCellView
        cell.textField!.stringValue = text
        
        return cell
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        let idx = outlineView.selectedRow
        if idx < 0 {
            textViewController?.item = nil
        } else {
            textViewController?.item = items[idx]
        }
    }
}
