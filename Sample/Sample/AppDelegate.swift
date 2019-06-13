//
//  AppDelegate.swift
//  Sample
//
//  Created by nya on 6/13/1 R.
//  Copyright © 1 Reiwa cathand.org. All rights reserved.
//

import Cocoa
import LicensePlistWindowController

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let bundle = Bundle(url: Bundle.main.url(forResource: "Settings", withExtension: "bundle")!)!
        let wc = LicensePlistWindowController.instantiate(info: bundle)!
        wc.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

