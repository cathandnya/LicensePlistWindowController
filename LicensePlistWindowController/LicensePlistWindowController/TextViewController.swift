//
//  TextViewController.swift
//  LicensePlistWindowController
//
//  Created by nya on 6/13/1 R.
//  Copyright © 1 Reiwa cathand.org. All rights reserved.
//

import Cocoa

class TextViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    var item: LicenseItem? {
        didSet {
            textView.string = item?.text ?? ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
