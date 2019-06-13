//
//  LicensePlistWindowController.swift
//  LicensePlistWindowController
//
//  Created by nya on 6/13/1 R.
//  Copyright © 1 Reiwa cathand.org. All rights reserved.
//

import Cocoa

public class LicensePlistWindowController: NSWindowController {

    public static func instantiate(info bundle: Bundle) -> LicensePlistWindowController? {
        guard let items = load(info: bundle) else {
            return nil
        }
        guard let wc = NSStoryboard(name: "LicensePlistWindowController", bundle: Bundle(for: LicensePlistWindowController.self)).instantiateInitialController() as? LicensePlistWindowController else {
            return nil
        }
        wc.items = items
        return wc
    }

    static func load(info bundle: Bundle) -> [LicenseItem]? {
        guard let url = bundle.url(forResource: "com.mono0926.LicensePlist", withExtension: "plist") else {
            return nil
        }
        guard let info = NSDictionary(contentsOf: url), let list = info["PreferenceSpecifiers"] as? [[AnyHashable: Any]] else {
            return nil
        }
        return list.compactMap { (obj) -> LicenseItem? in
            guard let file = obj["File"] as? String else {
                return nil
            }
            guard let title = obj["Title"] as? String else {
                return nil
            }
            guard let fileUrl = bundle.url(forResource: file, withExtension: "plist"), let fileInfo = NSDictionary(contentsOf: fileUrl), let list = fileInfo["PreferenceSpecifiers"] as? [[AnyHashable: Any]] else {
                return nil
            }
            guard let text = list.first?["FooterText"] as? String else {
                return nil
            }
            return LicenseItem(file: file, title: title, text: text)
        }
    }

    var sourceViewController: SourceViewController? {
        return (contentViewController as? NSSplitViewController)?.splitViewItems.first?.viewController as? SourceViewController
    }
    var textViewController: TextViewController? {
        return (contentViewController as? NSSplitViewController)?.splitViewItems.last?.viewController as? TextViewController
    }

    var items: [LicenseItem] = [] {
        didSet {
            sourceViewController?.items = items
        }
    }
}

struct LicenseItem {
    
    let file: String
    let title: String
    let text: String
}
