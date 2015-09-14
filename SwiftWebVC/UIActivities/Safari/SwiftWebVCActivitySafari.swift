//
//  SwiftWebVCActivitySafari.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Sam Vermette. All rights reserved.
//

import UIKit

class SwiftWebVCActivitySafari : SwiftWebVCActivity {
    
    override func activityTitle() -> String {
        return NSLocalizedString("Open in Safari", tableName: "SwiftWebVC", comment: "")
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems {
            if activityItem .isKindOfClass(NSURL) && UIApplication.sharedApplication().canOpenURL(activityItem as! NSURL) {
                return true
            }
        }
        return false
    }
    
    override func performActivity() {
        let completed: Bool = UIApplication.sharedApplication().openURL(URLToOpen!)
        activityDidFinish(completed)
    }
    
}